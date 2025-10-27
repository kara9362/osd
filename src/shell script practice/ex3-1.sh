# ./ex3-1.sh <숫자1> <숫자2>

NUM1=$1
NUM2=$2

echo "입력된 숫자: $NUM1, $NUM2"

# 덧셈
SUM=$((NUM1 + NUM2))
echo "덧셈: $NUM1 + $NUM2 = $SUM"

# 뺄셈
SUB=$((NUM1 - NUM2))
echo "뺄셈: $NUM1 - $NUM2 = $SUB"

# 곱셈
MUL=$((NUM1 * NUM2))
echo "곱셈: $NUM1 * $NUM2 = $MUL"

# 나눗셈
DIV=$((NUM1 / NUM2))
echo "나눗셈: $NUM1 / $NUM2 = $DIV"