#!/bin/bash     # 告诉解释器是以/bash/shell这个解释器来解析shell脚本

# 变量
## 系统变量
echo "path = $PATH"
echo "user = $USER"

## 用户自定义变量
VAR=2   # 定义变量
unset VAR # 撤销变量
readonly STATIC_VAR=2 # 静态变量
# unset STATIC_VAR  # 静态变量不能unset

## 引用变量
$var
