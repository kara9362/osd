#!/bin/bash

# 1) 사용자 정보
show_user_info() {
    echo "1) 사용자 정보"
    who
}

# 2) CPU 사용률 확인
show_cpu_gpu_usage() {
    echo "2) CPU 사용률 (상위 5개 프로세스)"
    top -bn1 | head -n 5
    
}

# 3) 메모리 사용량 확인
show_memory_usage() {
    echo "3) 메모리 사용량"
    free -h
}

# 4) 디스크 사용량 확인
show_disk_usage() {
    echo "4) 디스크 사용량"
    df -h
    echo ""
    echo "현재 디렉토리 디스크 사용량"
    du -sh .
}

# 메인 루프 및 메뉴 표시
while true; do
    echo "==================================="
    echo "   리눅스 시스템 상태 확인 메뉴"
    echo "==================================="
    echo "1) 사용자 정보"
    echo "2) GPU 또는 CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "-----------------------------------"
    read -p "input: " choice

    case $choice in
        1) show_user_info ;;
        2) show_cpu_gpu_usage ;;
        3) show_memory_usage ;;
        4) show_disk_usage ;;
        5) echo "종료합니다."; break

    esac
    echo ""
done