#!/bin/bash

# 参数为6则输出周六, 为7输出周日, 否则输出工作日
case $1 in
    "6")
    echo "周六"
    ;;
    "7")
    echo "周日"
    ;;
    *)
    echo "工作日"
    ;;
esac
