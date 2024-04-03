#!/bin/bash

PATENT_FILE="pubnr_cn.txt"

# 根目录，所有生成的目录和文件夹将会在这个目录下
ROOT_DIR="./patent_folders"

# 检查并创建根目录
if [ ! -d "$ROOT_DIR" ]; then
    mkdir -p "$ROOT_DIR"
fi

# 读取文件中的每一行
while IFS= read -r patent_number
do
    # 计算目录层级
    let "dir1 = $(printf '%d' "$patent_number") / 100 % 100"
    let "dir2 = $(printf '%d' "$patent_number") / 10000 % 100"
    let "dir3 = $(printf '%d' "$patent_number") / 1000000 % 100"

    # 生成目录路径
    DIR_PATH="$ROOT_DIR/$dir3/$dir2/$dir1"

    # 检查并创建目录
    if [ ! -d "$DIR_PATH" ]; then
        mkdir -p "$DIR_PATH"
    fi

    # 在相应目录下为专利号创建一个文件夹
    mkdir "$DIR_PATH/$patent_number"

done < "$PATENT_FILE"

echo "Folders created successfully."
