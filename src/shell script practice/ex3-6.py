#!/usr/bin/env python3
import sys

print("실행 파일 시작")
print(f"스크립트 이름: {sys.argv[0]}")

if len(sys.argv) > 1:
    print(f"입력된 인자들: {sys.argv[1:]}")

print("실행 파일 끝")