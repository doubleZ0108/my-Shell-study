#!/bin/bash

# 用户自定义函数
## 求两个数的和
function getSum(){
    SUM=$[$N1+$N2]
    return $SUM
}

read -p "请输入第一个参数: " N1
read -p "请输入第二个参数: " N2

getSum $N1 $N2          # 首先执行函数
SUM=$?                  # 通过$?获取函数的返回值
echo "sum is $SUM"
