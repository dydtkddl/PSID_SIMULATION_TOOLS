import sys

def extract_xyz_block(xyz_path):
    """XYZ 파일에서 좌표 블록 추출 (원자 수/코멘트 줄 제거)"""
    with open(xyz_path, 'r') as f:
        lines = f.readlines()
    coords = [line for line in lines if line.strip() and not line[0].isdigit()]
    coords = coords[1:]  # 첫 두 줄 제거 (원자 수, 코멘트)
    return ''.join(coords)

def inject_coords_into_inp(inp_template_path, xyz_path, output_path):
    """*.inp 템플릿의 * xyz ... * 부분을 XYZ 좌표로 채워 새 파일 생성"""
    with open(inp_template_path, 'r') as f:
        lines = f.readlines()

    start_idx = None
    end_idx = None
    for i, line in enumerate(lines):
        if line.strip().startswith('* xyz'):
            start_idx = i
        elif start_idx is not None and line.strip().startswith('*'):
            end_idx = i
            break

    if start_idx is None or end_idx is None:
        raise ValueError("입력 템플릿에 '* xyz ... *' 블록이 정확히 지정되지 않았습니다.")

    # xyz 좌표 읽기
    xyz_block = extract_xyz_block(xyz_path)

    # 새로운 라인 구성
    new_lines = lines[:start_idx+1] + [xyz_block] + lines[end_idx:]

    with open(output_path, 'w') as f:
        f.writelines(new_lines)

    print(f"[+] 생성된 파일: {output_path}")

# === 실행 ===
if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("사용법: python 00_make_restart.py base.inp structure.xyz output.inp")
        sys.exit(1)

    inp_template = sys.argv[1]
    xyz_file = sys.argv[2]
    output_file = sys.argv[3]

    inject_coords_into_inp(inp_template, xyz_file, output_file)

