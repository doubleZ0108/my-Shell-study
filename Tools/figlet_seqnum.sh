#/bin/bash

for i in $(seq 1 9)
do

figlet $i > $i".txt";	# 数字与字符串拼接，默认将数字转化为字符串

done
