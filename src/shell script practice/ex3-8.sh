#!/bin/bash

DB_DIR="DB"
TRAIN_DIR="train"
ARCHIVE_FILE="DB_compressed.tar.gz"
NUM_FILES=5


# 1. DB라는 폴더가 있는지 확인하고 없다면 생성
if [ ! -d "$DB_DIR" ]; then
    echo "$DB_DIR 폴더가 없습니다."
    mkdir -p "$DB_DIR"
else
    echo "$DB_DIR 폴더가 이미 존재합니다."
fi

# 2. 생성된 폴더에서 5개의 파일을 만들고 압축하기
for i in $(seq 1 $NUM_FILES); do
    FILE_NAME="$DB_DIR/data_$(printf "%02d" $i).txt"
    echo "This is data file $i. Created at $(date)" > "$FILE_NAME"
    echo "파일 생성: $FILE_NAME"
done

echo ""
echo "$DB_DIR 폴더를 압축합니다: $ARCHIVE_FILE"
# DB 폴더 안의 file 압축
tar -czvf "$ARCHIVE_FILE" -C "$DB_DIR" .
echo "압축 완료: $ARCHIVE_FILE"


# 3. train 폴더 생성
if [ ! -d "$TRAIN_DIR" ]; then
    mkdir -p "$TRAIN_DIR"
else
    echo "$TRAIN_DIR 폴더가 이미 존재합니다. 내용을 삭제합니다."
    rm -f "$TRAIN_DIR"/*
fi

# DB 파일에 대한 심볼릭 링크 생성
for i in $(seq 1 $NUM_FILES); do
    SOURCE_FILE="$DB_DIR/data_$(printf "%02d" $i).txt"
    LINK_NAME="$TRAIN_DIR/link_$(printf "%02d" $i).txt"
    # 심볼릭 링크 생성
    ln -s "../$SOURCE_FILE" "$LINK_NAME"
    echo "링크 생성: $LINK_NAME -> $SOURCE_FILE"
done

echo ""
echo "$DB_DIR 폴더 내용:"
ls -l "$DB_DIR"
echo ""
echo "$TRAIN_DIR 폴더 내용 (링크):"
ls -l "$TRAIN_DIR"