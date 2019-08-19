#!/bin/bash

# basename 获取文件名
FILE=`basename /文档/Shell/study/bbb.txt`
echo "$FILE"            # bbb.txt

FILENAME=`basename /文档/Shell/study/bbb.txt .txt`
echo "$FILENAME"        # bbb
