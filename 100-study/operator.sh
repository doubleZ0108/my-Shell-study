#!/bin/bash
# 运算符 

## 例.计算 (2+3)*4

# 第一种方式: $[]
RESULT1=$[(2+3)*4]
echo "RESULT1 = $RESULT1"

# 第二种方式: $(())
RESULT2=$(((2+3)*4))
echo "RESULT2 = $RESULT2"

# 第三种方式: expr
TEMP=`expr 2 + 3`
RESULT3=`expr $TEMP \* 4`
echo "RESULT3 = $RESULT3"
## 将第三种方式的分布合并成一步
RESULT4=`expr $(expr 2 + 3) \* 4`
echo "RESULT4 = $RESULT4"
