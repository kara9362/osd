#!/bin/bash

echo 'export MYENV="Hello Shell"' >> ~/.bashrc

export MYENV="Hello Shell" 

echo "1. 환경 변수 설정"
echo "MYENV 변수 값: $MYENV"
echo ""

unset MYENV
echo "2. 환경 변수 해제 후 확인"
echo "MYENV 변수 값: $MYENV"
echo ""

# sed -i '/export MYENV="Hello Shell"/d' ~/.bashrc