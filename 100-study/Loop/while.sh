#!/bin/bash

# while循环
## 1~100求和
i=0
SUM=0
while [ $i -le 100 ]
do
    SUM=$[$SUM+$i]
    i=$[$i+1]
done
echo "sum is $SUM"
