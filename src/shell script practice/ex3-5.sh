#!/bin/bash

run_linux_command() {
    # 첫 번째 인자는 명령어, 나머지 인자는 옵션으로 처리
    local command_name="$1"
    shift # 옵션만 남기기
    local options="$@"

    echo "명령어 실행: $command_name $options"
    
    # 명령어와 옵션을 실행
    eval "$command_name $options"
    
    echo "------------------------------"
}

# ./ex3-5.sh <명령어> <옵션>
if [ $# -ge 1 ]; then
    run_linux_command "$@"
fi
