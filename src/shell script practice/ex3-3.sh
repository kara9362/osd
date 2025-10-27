#!/bin/bash

TOTAL_SCORE=0
NUM_SUBJECTS=$#

echo "과목 등급"

# 각 점수 처리
for SCORE in "$@"; do

    # 등급 결정
    if [ "$SCORE" -ge 90 ]; then
        GRADE="A"
    else
        GRADE="B"
    fi

    echo "점수: $SCORE, 등급: $GRADE"
    TOTAL_SCORE=$((TOTAL_SCORE + SCORE))
done

# 평균 계산
AVERAGE=$(echo "scale=0; $TOTAL_SCORE / $NUM_SUBJECTS" | bc)

# 평균 등급 결정
if [ "$AVERAGE" -ge 90 ]; then
    AVG_GRADE="A"
else
    AVG_GRADE="B"
fi

echo ""
echo "전체 평균 및 등급"
echo "총점: $TOTAL_SCORE"
echo "과목 수: $NUM_SUBJECTS"
echo "평균 점수: $AVERAGE"
echo "평균 등급: $AVG_GRADE"