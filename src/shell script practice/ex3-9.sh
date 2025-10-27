#!/bin/bash

TEAM_DB="DB.txt"

 
# 1) 팀원 정보 추가
add_member() {
    read -p "팀원 이름: " name
    read -p "생일: " birthday
    
    # DB.txt에 저장
    echo "M | $name | $birthday" >> "$TEAM_DB"
    echo "팀원 정보가 추가되었습니다."
}

 
# 2) 팀원과 나눈 일 기록: 날짜와 내용
add_activity() {
    read -p "활동 날짜 (YYYY-MM-DD): " date
    read -p "활동 내용: " content

    # DB.txt에 저장
    echo "A | $date | $content" >> "$TEAM_DB"
    echo "활동 기록이 추가되었습니다."
}

 
# 3) 팀원 검색: 이름으로 생일 검색
search_member() {
    read -p "검색할 팀원 이름: " keyword
    
    if [ -z "$keyword" ]; then
        echo "검색 키워드를 입력하세요."
        return
    fi

    # 팀원만 검색
    SEARCH_RESULTS=$(grep "^M |" "$TEAM_DB" | grep -i "$keyword")

    echo "검색 결과 ($keyword)"

    if [ -z "$SEARCH_RESULTS" ]; then
        echo "검색 결과가 없습니다."
        return
    fi

    echo "$SEARCH_RESULTS" | while IFS='|' read -r type name birthday; do
        # 공백 제거
        name=$(echo "$name" | xargs)
        birthday=$(echo "$birthday" | xargs)
        
        # 이름과 생일만 출력
        echo "이름: $name, 생일: $birthday"
    done
}

 
# 4) 수행 내용 검색: 날짜로 활동 내용 검색
search_activities() {
    read -p "검색할 활동 날짜 (YYYY-MM-DD): " keyword
    
    if [ -z "$keyword" ]; then
        echo "검색 키워드를 입력하세요."
        return
    fi

    # 활동만 검색
    SEARCH_RESULTS=$(grep "^A |" "$TEAM_DB" | grep -i "$keyword")

    echo "검색 결과 ($keyword)"
    
    if [ -z "$SEARCH_RESULTS" ]; then
        echo "검색 결과가 없습니다."
        return
    fi
    
    # 날짜와 내용만 출력
    echo "$SEARCH_RESULTS" | while IFS='|' read -r type date content; do
        # 공백 제거
        date=$(echo "$date" | xargs)
        content=$(echo "$content" | xargs)

        echo "날짜: $date, 내용: $content"
    done
}

# 메인 루프
# DB 파일이 없으면 생성
if [ ! -f "$TEAM_DB" ]; then
    touch "$TEAM_DB"
fi

while true; do
    echo "=================================="
    echo "      팀 정보/활동 관리 메뉴"
    echo "=================================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색 (이름으로 생일 검색)"
    echo "4) 활동 검색 (날짜로 내용 검색)"
    echo "5) 종료"
    echo "=================================="
    read -p "input: " choice

    case $choice in
        1) add_member ;;
        2) add_activity ;;
        3) search_member ;; # 함수 이름 변경 및 기능 분리
        4) search_activities ;; # 함수 이름 변경 및 기능 분리
        5) echo "종료합니다."; break
    esac
    echo ""
done