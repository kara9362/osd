#!/bin/bash

declare -A SCORES

# 1) 과목 성적 추가
add_score() {
    read -p "과목명 입력: " subject
    read -p "점수 입력: " score

    SCORES["$subject"]="$score"
    echo "$subject 과목에 $score점이 추가되었습니다."
}

# 2) 입력된 모든 점수 보기
view_all_scores() {
    if [ ${#SCORES[@]} -eq 0 ]; then
        echo "등록된 성적이 없습니다."
        return
    fi

    echo "모든 과목 성적"
    for subject in "${!SCORES[@]}"; do
        echo "과목: $subject, 점수: ${SCORES[$subject]}"
    done
}

# 3) 평균 점수 확인
calculate_average() {
    if [ ${#SCORES[@]} -eq 0 ]; then
        echo "등록된 성적이 없습니다."
        return
    fi

    TOTAL=0
    COUNT=0
    for score in "${SCORES[@]}"; do
        TOTAL=$((TOTAL + score))
        COUNT=$((COUNT + 1))
    done

    AVERAGE=$(echo "scale=2; $TOTAL / $COUNT" | bc)
    echo "평균 점수: $AVERAGE"
}

# 4) 평균 등급(GPA) 변환
convert_gpa() {
    if [ ${#SCORES[@]} -eq 0 ]; then
        echo "등록된 성적이 없습니다."
        return
    fi

    calculate_average # 평균 점수 먼저 계산

    if (( $(echo "$AVERAGE >= 90" | bc -l) )); then
        GPA="4.0"
    elif (( $(echo "$AVERAGE >= 80" | bc -l) )); then
        GPA="3.0"
    elif (( $(echo "$AVERAGE >= 70" | bc -l) )); then
        GPA="2.0"
    elif (( $(echo "$AVERAGE >= 60" | bc -l) )); then
        GPA="1.0"
    else
        GPA="0.0"
    fi

    echo "GPA: $GPA"
}

# 메인 루프 및 메뉴 표시
while true; do
    echo "=============================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "=============================="
    read -p "input: " choice

    case $choice in
        1) add_score ;;
        2) view_all_scores ;;
        3) calculate_average ;;
        4) convert_gpa ;;
        5) echo "프로그램을 종료합니다."; break ;;
    esac
    echo ""
done