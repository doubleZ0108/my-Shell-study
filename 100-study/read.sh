#!/bin/bash

# read读取控制台输入
## 读取控制台的信息(阻塞)
read -p "请输入NUM1的值: " NUM1
echo "num1 = $NUM1"

## 十秒钟之内读取控制台的信息
read -t 10 -p "请在10秒钟内输入NUM2的值: " NUM2
echo "num2 = $NUM2"
