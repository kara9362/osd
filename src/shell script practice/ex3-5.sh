#!/bin/bash

run_linux_command() {
    # 첫 번째 인자는 명령어, 나머지 인자는 옵션으로 처리
    local command_name="$1"
    shift # 명령어 이름을 제거하고 옵션만 남김
    local options="$@"

    echo "명령어 실행: $command_name $options"
    
    # 'eval'을 사용하여 명령어와 옵션을 조합하여 실행
    # 주의: eval은 보안상 위험할 수 있으므로, 신뢰할 수 있는 입력에만 사용해야 합니다.
    eval "$command_name $options"
    
    echo "------------------------------"
}

# ./ex3-5.sh <명령어> <옵션>
if [ $# -ge 1 ]; then
    run_linux_command "$@"
fi