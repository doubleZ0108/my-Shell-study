#!/bin/bash

# 位置参数

echo "$0 $1 $2"	# 第几个参数的值, 10以上要用`${10}
echo "$*"		    # 全部的参数
echo "$@"		    # 全部参数, 区分对待
echo "$#"		    # 参数个数

：<<!
样例输入: ./positionParam.sh 10 20
样例输出:
./positionParam.sh 10 20
10 20
10 20
2
!
