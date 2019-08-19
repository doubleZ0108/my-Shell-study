#!/bin/bash

# 如果参数大于等于90则输出优秀; 如果小于90大于等于60输出几个; 否则不及格
if [ $1 -ge 90 ]
then
    echo "优秀"
elif [ $1 -ge 60 ]
then
    echo "及格"
else
    echo "不及格"
fi
