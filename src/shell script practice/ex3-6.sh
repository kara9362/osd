#!/bin/bash

# ./ex3-6.sh <인자1> <인자2>

PYTHON_SCRIPT="./ex3-6.py" 

echo "실행 파일을 호출하는 셸 스크립트"
# 인자는 $@를 통해 전달
"$PYTHON_SCRIPT" "$@"

echo "셸 스크립트 실행 완료"