#!/bin/bash

# for循环

## 输出参数
## $* -> 将所有参数当作整体
echo "\$*"
for j in "$*"
do
    echo $j
done

echo "=========================="

## $@ -> 将参数区别对待
echo "\$@"
for k in "$@"
do
    echo $k
done

echo "=========================="


## 1~100求和
SUM=0
for((i=0;i<=100;++i))
do
    SUM=$[$SUM+$i]
done
echo "sum is $SUM"
echo "=========================="


## 九九乘法表
for((i=1;i<10;++i))
do
    for((j=1;j<=i;++j))
    do
        echo -n "$i * $j = $[$i*$j] "       # 结尾无换行
    done
    echo ""
done
