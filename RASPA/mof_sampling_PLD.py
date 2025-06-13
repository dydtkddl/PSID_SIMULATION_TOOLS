import math
from rdkit import Chem
from rdkit.Chem import AllChem
from rdkit.Chem import PeriodicTable 

def compute_vdw_diameter_rdkit(smiles_str):
    """
    RDKit을 사용해 SMILES 문자열로부터 분자의 가장 큰 VdW 직경을 추정하는 예시 함수.
      1) SMILES -> Mol 객체 변환
      2) 수소 원자 추가 (Chem.AddHs)
      3) 3D 좌표 임베딩 (AllChem.EmbedMolecule)
      4) MMFF로 빠른 최적화
      5) 각 원자의 (x,y,z) 좌표와 VdW 반지름 가져옴
      6) 모든 원자 쌍 (i,j)에 대해 dist(i,j) + r_vdw(i) + r_vdw(j) 중 최대값

    returns float(가장 큰 VdW 직경, Å 단위)
    """

    # 1) SMILES -> Mol
    mol = Chem.MolFromSmiles(smiles_str)
    if mol is None:
        raise ValueError(f"SMILES 파싱 실패: {smiles_str}")

    # 2) 수소 추가
    mol = Chem.AddHs(mol)

    # 3) 3D 좌표 생성 (임베딩)
    #    randomSeed=0 등으로 재현성 제어 가능
    status = AllChem.EmbedMolecule(mol, maxAttempts=1000, randomSeed=42)
    if status != 0:
        raise ValueError(f"3D 임베딩 실패: {smiles_str}")
    
    # 4) 간단한 에너지 최소화(MMFF)
    AllChem.MMFFOptimizeMolecule(mol)

    # (원자 좌표, VdW 반지름) 목록
    coords = []
    radii = []

    conf = mol.GetConformer()
    for atom in mol.GetAtoms():
        idx = atom.GetIdx()
        pos = conf.GetAtomPosition(idx)  # RDGeom.Point3D
        x, y, z = pos.x, pos.y, pos.z

        at_num = atom.GetAtomicNum()
        # RDKit의 Rowland식 VdW반지름
        vdw_r = PeriodicTable.GetRvdw(at_num)

        coords.append((x, y, z))
        radii.append(vdw_r)

    n_atoms = len(coords)
    if n_atoms == 0:
        return 0.0
    if n_atoms == 1:
        return 2.0 * radii[0]

    max_vdw_diameter = 0.0
    for i in range(n_atoms):
        x1, y1, z1 = coords[i]
        r1 = radii[i]
        for j in range(i+1, n_atoms):
            x2, y2, z2 = coords[j]
            r2 = radii[j]
            dist = math.dist((x1, y1, z1), (x2, y2, z2))
            diameter_ij = dist + r1 + r2
            if diameter_ij > max_vdw_diameter:
                max_vdw_diameter = diameter_ij

    return max_vdw_diameter
import os
import pandas as pd

# (위에서 정의한) compute_vdw_diameter_rdkit 함수 import 또는 같은 파일 내에 선언
# from my_vdw_module import compute_vdw_diameter_rdkit

def main():
    # 1) 사용자에게 SMILES 입력
    smiles_input = input("분자 SMILES를 입력하세요 (예: CCO): ").strip()
    if not smiles_input:
        print("SMILES가 필요합니다.")
        return
    
    # 2) RDKit으로 가장 큰 VdW 직경 계산
    try:
        diameter = compute_vdw_diameter_rdkit(smiles_input)
    except Exception as e:
        print(f"직경 계산 실패: {e}")
        return
    
    print(f"분자 [{smiles_input}]의 최대 VdW 직경: {diameter:.3f} Å")

    # 3) CSV 로딩 & 필터링
    csv_path = "./[02]MOFS/CoreMOF/2019-11-01-ASR-public_12020.csv"
    if not os.path.exists(csv_path):
        print(f"CSV 파일을 찾을 수 없습니다: {csv_path}")
        return
    df = pd.read_csv(csv_path)
    if "PLD" not in df.columns:
        print("PLD 컬럼이 없습니다.")
        return

    # PLD > diameter 필터
    filtered = df[df["PLD"] > diameter]
    # filename에 '_clean' 포함
    filtered_clean = filtered[ filtered["filename"].str.contains("_clean", na=False) ]

    # 4) 결과 저장
    result_txt = "filtered_clean_filenames.txt"
    filtered_clean["filename"].to_csv(result_txt, index=False, header=False)
    print(f"{len(filtered_clean)}개 행이 필터링됨. '{result_txt}'에 저장 완료.")

    # 5) 추가로 split_and_save(...) 같은 로직 호출 가능
    #    예: num_parts = int(input("분할 개수?: ")) ...
    #    split_and_save(...)

if __name__ == "__main__":
    main()
