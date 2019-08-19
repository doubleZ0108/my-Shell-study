#!/bin/bash

# 判断ok是否等于ok
if [ "ok" = "ok" ]
then
    echo "ok is equal to ok"
fi

# 判断79是否大于23
if [ 79 -gt 23]
then
    echo "79 is greater than 23"
fi

# 判断/root/Shell/study/aaa.txt文件是否存在
if [ -e /root/Shell/study/aaa.txt ]
then
    echo "this file is exist"
fi
