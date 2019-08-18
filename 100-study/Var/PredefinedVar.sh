#!/bin/bash
# 预定义变量

echo "当前进程的PID = $$"

# 以后台方式运行shell脚本
./myShell.sh &
echo " 后台运行的最后一个进程的PID = $!"

echo "最后一次执行的命令状态 = $?"
