# 变量

- 变量类型:
  - 系统变量
  - 用户自定义变量
- 查看所有变量: `set`
- **定义变量:**
  - 等号两侧不能有空格
  - 一般使用大写
  - **将命令的返回值赋给变量:** \`ls -l\`  <=>  $(ls -l)

## 设置环境变量

可以理解为超全局的变量

例. 在`/etc/profile`中定义一个变量`TOMCAY_HOME`, 在其他shell脚本中可以使用

1. 编辑该文件

   ```shell
   TOMCAT_HOME=/etc/profile
   export TOMCAT_HOME
   ```

2. 刷新文件

   ```shell
   source /etc/profile
   ```

3. 可以直接在终端中`echo $TOMCAT_HOME`

4. 也可以在自己写的shell脚本中使用

## 位置参数变量

获取在命令行的参数信息

- `$数字`: 第几个参数的值, 10以上要用`${10}`
- `$*`: 全部的参数
- `$@`": 全部参数, 区分对待
- `$#`: 参数个数

## 预定义变量

- `$$`: 当前进程的PID
- `$!`: 后台运行的最后一个进程的PID
- `$?`: 最后一次执行的命令状态 (0 -> 上一个命令正确执行; 非0 -> 不正确)
