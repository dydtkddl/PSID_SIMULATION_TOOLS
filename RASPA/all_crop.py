import os
import glob
import subprocess
import sys

# 사용 예: python run_all.py "He_*" 4
if len(sys.argv) < 3:
    print("사용법: python run_all.py '폴더패턴' CPU_코어수")
    sys.exit(1)

pattern = sys.argv[1]
n_cpus = int(sys.argv[2])  # 사용할 CPU 개수
base_dir = os.getcwd()
folder_list = [f for f in glob.glob(pattern) if os.path.isdir(f)]

# 코어 번호 설정 (예: 0~n_cpus-1)
core_list = ",".join(str(i) for i in range(n_cpus))

for folder in folder_list:
    print(f"▶ {folder} 실행 중 (CPU {core_list})...")
    os.chdir(os.path.join(base_dir, folder))
    
    # 실행 명령어 (taskset 사용)
    cmd = [
        "taskset", "-c", core_list,  # 코어 지정
        "python", "05crop_simulations.py"
    ]
    # 로그 파일 저장
    with open("05_1_crop_simulation_py_run.log", "w") as log_file:
        subprocess.Popen(cmd, stdout=log_file, stderr=log_file)

    os.chdir(base_dir)

