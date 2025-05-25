import numpy as np
import sys
import os

# 1. 인자 확인
if len(sys.argv) < 4:
    print("사용법: python fix_pdb.py <input_pdb> <residue_name> <desired_names_comma_separated>")
    sys.exit(1)

input_file = sys.argv[1]
resname_new = sys.argv[2].ljust(3)[:3]
desired_names_str = sys.argv[3]
desired_names = [name.strip() for name in desired_names_str.split(',') if name.strip()]

# 입력 파일명에서 경로 제거 및 확장자 제거
basename = os.path.splitext(os.path.basename(input_file))[0]
output_file = f"{basename}_sorted.pdb"

skip_prefix = ("COMPND", "AUTHOR", "CONECT", "MASTER", "END")

with open(input_file, "r") as f:
    lines = [line for line in f if not line.startswith(skip_prefix)]

# 원자 파싱
atoms = []
for line in lines:
    if line.startswith(("ATOM", "HETATM")):
        atoms.append({
            'raw': line,
            'type': line[:6].strip(),
            'idx': int(line[6:11]),
            'name': line[12:16].strip(),
            'resn': line[17:20].strip(),
            'chain': line[21],
            'resid': int(line[22:26]),
            'x': float(line[30:38]),
            'y': float(line[38:46]),
            'z': float(line[46:54]),
            'element': line[76:78].strip() or line[12:14].strip()
        })

# UNL 분리 및 이름 변경
unl_atoms = [a for a in atoms if a['resn'] == 'UNL']
hoh_atoms = [a for a in atoms if a['resn'] == 'HOH']
for a in unl_atoms:
    a['resn'] = resname_new

# UNL 연결 (DFS)
coords = np.array([[a['x'], a['y'], a['z']] for a in unl_atoms])
n = len(unl_atoms)
adj = [[] for _ in range(n)]
bond_cutoff = {
    ('H', 'H'): 1.0, ('H', 'C'): 1.2, ('H', 'N'): 1.2, ('H', 'O'): 1.2,
    ('C', 'C'): 1.8, ('C', 'N'): 1.8, ('C', 'O'): 1.8, ('N', 'O'): 1.6,
    ('N', 'N'): 1.8, ('O', 'O'): 1.6,
}
default_cutoff = 1.6

for i in range(n):
    for j in range(i + 1, n):
        dist = np.linalg.norm(coords[i] - coords[j])
        key = tuple(sorted([unl_atoms[i]['element'], unl_atoms[j]['element']]))
        if dist < bond_cutoff.get(key, default_cutoff):
            adj[i].append(j)
            adj[j].append(i)

visited = [False] * n
ordered_atoms = []

def dfs(v):
    visited[v] = True
    ordered_atoms.append(unl_atoms[v])
    neighbors = adj[v]
    H_first = sorted([u for u in neighbors if not visited[u] and unl_atoms[u]['element'] == 'H'],
                     key=lambda x: unl_atoms[x]['name'])
    rest = sorted([u for u in neighbors if not visited[u] and unl_atoms[u]['element'] != 'H'],
                  key=lambda x: unl_atoms[x]['element'])
    for u in H_first + rest:
        dfs(u)

start = next((i for i, a in enumerate(unl_atoms) if a['name'] == 'N'), 0)
dfs(start)

# 이름 재지정
for i, atom in enumerate(ordered_atoms):
    atom['name'] = desired_names[i] if i < len(desired_names) else atom['name']
    atom['type'] = "ATOM"

# HOH 처리: O 기준 거리로 가까운 H 2개 할당
hoh_O_atoms = [a for a in hoh_atoms if a['element'] == 'O']
hoh_H_atoms = [a for a in hoh_atoms if a['element'] == 'H']
assigned = set()

for o_atom in hoh_O_atoms:
    o_coord = np.array([o_atom['x'], o_atom['y'], o_atom['z']])
    h_dists = []
    for h_atom in hoh_H_atoms:
        if h_atom['idx'] in assigned:
            continue
        h_coord = np.array([h_atom['x'], h_atom['y'], h_atom['z']])
        dist = np.linalg.norm(o_coord - h_coord)
        h_dists.append((dist, h_atom))
    h_dists.sort(key=lambda x: x[0])
    for _, h_atom in h_dists[:2]:  # 가장 가까운 2개만 선택
        h_atom['resid'] = o_atom['resid']
        h_atom['chain'] = o_atom['chain']
        assigned.add(h_atom['idx'])

# 병합 및 재정렬
final_atoms = ordered_atoms + sorted(hoh_O_atoms + hoh_H_atoms, key=lambda x: x['idx'])
for i, atom in enumerate(final_atoms):
    atom['idx'] = i + 1

# 출력
def format_atom(atom):
    return (
        f"{atom['type']:<6s}{atom['idx']:5d} {atom['name']:<4s}{atom['resn']:<3s} {atom['chain']}"
        f"{atom['resid']:4d}    {atom['x']:8.3f}{atom['y']:8.3f}{atom['z']:8.3f}\n"
    )

with open(output_file, "w") as f:
    for atom in final_atoms:
        f.write(format_atom(atom))
