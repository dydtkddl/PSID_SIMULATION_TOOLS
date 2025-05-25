#!/bin/bash

# 자동 입력을 위한 키 시퀀스
INPUT_SEQUENCE="1\n2\ny\n4\n120\n5\n7\n11\n12\n"

# 실행 함수
run_one() {
  INPUT="$1"
  INDEX="$2"
  TOTAL="$3"
  echo "📦 ($INDEX/$TOTAL) Processing: $INPUT"

  # Step 1: orca_plot 실행 + 자동 입력
  echo -e "$INPUT_SEQUENCE" | orca_plot "$INPUT.gbw" -i

  # Step 2: python mep.py 실행
  python ${AX}/mep.py "$INPUT" 120
}

# -all 옵션: 현재 디렉토리 모든 .gbw 처리
if [ "$1" = "-all" ]; then
  echo "📁 모든 .gbw 파일 처리 시작"

  files=( *.gbw )
  total=${#files[@]}
  index=1

  for file in "${files[@]}"; do
    [ -e "$file" ] || continue
    base="${file%.gbw}"
    run_one "$base" "$index" "$total"
    index=$((index + 1))
  done

  echo "✅ 전체 완료!"
  exit 0
fi

# 인자가 없는 경우
if [ "$#" -eq 0 ]; then
  echo "❗ 사용법:"
  echo "   ./run_mep.sh input1 input2 ...  (확장자 없이)"
  echo "   또는 ./run_mep.sh -all"
  exit 1
fi

# 여러 개의 input 처리
total=$#
index=1
for input in "$@"; do
  run_one "$input" "$index" "$total"
  index=$((index + 1))
done
