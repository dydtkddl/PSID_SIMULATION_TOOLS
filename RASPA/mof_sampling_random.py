import os
import random
import shutil

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
MOF_DIR = os.path.join(CURRENT_DIR, "[01]MOFS")

print(MOF_DIR)
def list_mof_files():
    txt_files = [f for f in os.listdir(MOF_DIR) if f.endswith(".txt")]
    return txt_files

def choose_file(files):
    print("Available MOF list files:")
    for idx, file in enumerate(files, 1):
        print(f"{idx}. {file}")
    
    while True:
        try:
            choice = int(input("Select a MOF list file by number: "))
            if 1 <= choice <= len(files):
                return files[choice - 1]
            else:
                print("Invalid number. Try again.")
        except ValueError:
            print("Please enter a number.")

def read_mof_list(filepath):
    with open(filepath, 'r') as f:
        lines = [line.strip() for line in f if line.strip()]
        mof_list = [line[:-4] if line.endswith('.cif') else line for line in lines]
    return mof_list

def get_sample_number(max_num):
    while True:
        try:
            num = int(input(f"How many MOFs to sample? (1 ~ {max_num}): "))
            if 1 <= num <= max_num:
                return num
            else:
                print("Out of range. Try again.")
        except ValueError:
            print("Please enter a number.")

def get_seed():
    seed_input = input("Enter random seed (default=42): ").strip()
    return int(seed_input) if seed_input else 42

def sample_mofs(mof_list, num_samples, seed):
    random.seed(seed)
    return random.sample(mof_list, num_samples)

def save_sampled_mofs(sampled, output_path):
    with open(output_path, 'w') as f:
        f.write("\n".join(sampled) + "\n")

def split_and_save(sampled_list, base_output_path, num_parts):
    part_size = len(sampled_list) // num_parts
    remainder = len(sampled_list) % num_parts

    # 템플릿 복사 여부
    use_template = input("📦 템플릿 파일들을 각 폴더에 복사하겠습니까? (1: 예, 그 외: 아니오): ").strip() == "1"

    # 폴더 이름 prefix 설정 여부
    use_prefix = input("📂 각 part 폴더 이름 앞에 prefix를 붙이시겠습니까? (1: 예, 그 외: 아니오): ").strip() == "1"
    prefix = ""
    if use_prefix:
        prefix = input("✏️ 사용할 prefix를 입력하세요 (예: CuBTC_): ").strip()

    CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
    TEMPLATE_DIR = os.path.join(CURRENT_DIR, "[00]template")

    for i in range(num_parts):
        start = i * part_size + min(i, remainder)
        end = start + part_size + (1 if i < remainder else 0)
        part = sampled_list[start:end]

        part_file = f"{base_output_path}_part{i+1}.txt"
        folder_name = prefix + part_file.replace(".txt", "")
        os.mkdir(folder_name)

        with open(os.path.join(folder_name, os.path.basename(part_file)), 'w') as f:
            f.write("\n".join(part) + "\n")

        print(f"📄 Saved part {i+1}: {part_file} ({len(part)} MOFs)")

        if use_template:
            if os.path.isdir(TEMPLATE_DIR):
                for template_file in os.listdir(TEMPLATE_DIR):
                    src_path = os.path.join(TEMPLATE_DIR, template_file)
                    dst_path = os.path.join(folder_name, template_file)
                    if os.path.isfile(src_path):
                        shutil.copy2(src_path, dst_path)
                with open(os.path.join(folder_name, "04cif_list.txt"), 'w') as f:
                    f.write("\n".join(part) + "\n")
                print(f"📁 Template files copied to {folder_name}")
            else:
                print(f"⚠️ Template directory '{TEMPLATE_DIR}' does not exist.")

def get_num_parts(max_parts):
    while True:
        try:
            parts = int(input(f"Split into how many files? (1 ~ {max_parts}): "))
            if 1 <= parts <= max_parts:
                return parts
            else:
                print("Out of range. Try again.")
        except ValueError:
            print("Please enter a number.")

def main():
    print("📁 Loading MOF list files from '[01]MOFS/'...")
    files = list_mof_files()
    if not files:
        print("❌ No .txt files found in '[01]MOFS/' directory.")
        return

    selected_file = choose_file(files)
    full_path = os.path.join(MOF_DIR, selected_file)
    mof_list = read_mof_list(full_path)


    print(f"\n✅ '{selected_file}' contains {len(mof_list)} MOFs.")



    num_samples = get_sample_number(len(mof_list))
    seed = get_seed()

    sampled = sample_mofs(mof_list, num_samples, seed)

    base_name = os.path.splitext(selected_file)[0]
    output_file = f"{base_name}_seed{seed}_{num_samples}.txt"
    output_path = os.path.join(MOF_DIR, output_file)
    save_sampled_mofs(sampled, output_file)
    print(f"\n🎉 {num_samples} MOFs sampled with seed={seed}. Saved to: {output_file}")

    num_parts = get_num_parts(num_samples)
    split_and_save(sampled, f"{base_name}_seed{seed}_{num_samples}", num_parts)


if __name__ == "__main__":
    main()
