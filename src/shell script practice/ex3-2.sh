# ./ex3-2.sh x1 x2

echo "y = 1/2 * x^2 계산 결과"

for X_VAL in "$@"; do
    # X_VAL * X_VAL / 2
    Y_VAL=$(echo "scale=4; ($X_VAL * $X_VAL) / 2" | bc -l)
    echo "x = $X_VAL 일 때, y = $Y_VAL"
done