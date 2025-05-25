import sys

def read_xyz_coordinates(xyz_path):
    with open(xyz_path, 'r') as f:
        lines = f.readlines()
    return ''.join(lines[2:])  # 첫 두 줄 제거하고 나머지 좌표 반환

def generate_input(base_template_path, xyz_path, output_path):
    # 좌표 추출
    coordinates = read_xyz_coordinates(xyz_path)

    # base.inp 읽고 {XYZ} 치환
    with open(base_template_path, 'r') as f:
        base_content = f.read()
    filled_content = base_content.replace("{XYZ}", coordinates.strip())

    # 결과 저장
    with open(output_path, 'w') as f:
        f.write(filled_content)

    print(f"[✓] ORCA input 파일이 '{output_path}'로 생성되었습니다.")

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("사용법: python generate_orca_input.py base.inp input.xyz output.inp")
        sys.exit(1)

    base_inp_path = sys.argv[1]
    xyz_file_path = sys.argv[2]
    output_file_path = sys.argv[3]

    generate_input(base_inp_path, xyz_file_path, output_file_path)
