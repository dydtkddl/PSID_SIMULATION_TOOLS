
with open("case_001.pdb", "r") as f:
    lines = f.readlines()

with open("case_001.pdb", "w") as f:
    for line in lines:
        f.write(line)
        if line.startswith("ATOM") and "ALA" in line:
            last_ala_line = line
    # 마지막 ALA 원자 다음에 TER 삽입
    last_res = last_ala_line[17:26]
    f.write(f"TER   {int(last_ala_line[6:11])+1:5d}      {last_res}\n")

