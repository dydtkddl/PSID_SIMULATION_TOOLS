#!/bin/bash

run_one() {
  INPUT="$1"
  echo "=============================="
  echo "📁 처리 중: $INPUT"

  # Step 1: ORCA 출력 → Molden 변환
  echo "Step 1: orca_2mkl 실행 중..."
  orca_2mkl "$INPUT" -molden

  # Step 2: molden2molden 변환
  echo "Step 2: molden2molden 실행 중..."
  java -jar "$JANPA/molden2molden.jar" -i "$INPUT.molden.input" -o "${INPUT}_janpa.molden" -fromorca3bf -orca3signs

  # Step 3: JANPA 실행
  echo "Step 3: JANPA 실행 중..."
  java -jar "$JANPA/janpa.jar" -i "${INPUT}_janpa.molden" > "${INPUT}.janpa.output"
  echo "✅ ${INPUT}.janpa.output 생성 완료!"
}

# -all 옵션이면 모든 .gbw 파일 처리
if [ "$1" = "-all" ]; then
  echo "📂 현재 디렉토리 내 모든 .gbw 파일 처리 시작..."
  for file in *.gbw; do
    # 확장자 제거
    base="${file%.gbw}"
    run_one "$base"
  done
  echo "🎉 전체 작업 완료!"
  exit 0
fi

# 단일 파일 처리
if [ -z "$1" ]; then
  echo "❗ 사용법: ./run_janpa.sh input_filename"
  echo "   또는:  ./run_janpa.sh -all"
  exit 1
fi

run_one "$1"
