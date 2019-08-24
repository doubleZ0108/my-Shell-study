

- 可以通过安装vmtools实现主机和linux的内容粘贴复制和定义共享文件夹

- 共享文件夹位于`/mnt/hgfs`目录下

- Windows目录结构: C盘下有好多文件, D盘下有好多文件...

- Linux目录结构: 采用层级式的梳妆目录结构

  - 只有一个根目录, 以此为根的一棵树

  - 在Linux世界里, 一切皆文件

    | 目录        | 功能                                                      |
    | ----------- | --------------------------------------------------------- |
    | /bin        | 经常使用的指令                                            |
    | /sbin       | 管理员是哦那个的系统管理指令                              |
    | /home       | 存放普通用户(没创建一个用户就在该文件夹中创建一个子文件夹 |
    | /root       | 管理员的主目录                                            |
    | /lib        | 动态连接库, 类似于Windows的DLL文件                        |
    | /etc        | 配置文件                                                  |
    | /usr        | 用户软件                                                  |
    | /boot       | 启动时的引导文件目录                                      |
    | /proc       | 内核(别动)                                                |
    | /srv        | 内核(别动)                                                |
    | /sys        | 内核(别动)                                                |
    | /dev        | 设备管理(所有硬件安都用文件的形式存储)                    |
    | /media      | 识别U盘, 光驱挂载的目录                                   |
    | /mnt        | 让用户临时挂在别的文件系统(共享文件夹)                    |
    | /opt        | 安装软件                                                  |
    | /user/local | 安装后的目录                                              |
| /var        | 日志文件                                                  |

- 远程工具: 需要Linux开启sshd服务, 该服务会监听22号端口

  - 登陆Linux软件 --> Xshell
  - 远程上传和下载文件 --> Xftp   协议一定要用SFTP, 只有22号端口提供服务
  
- 查看ip地址 `ifconfig`

- 查看目录下的文件 `ll`

- vi和vim

  ![image.png](https://upload-images.jianshu.io/upload_images/12014150-da76a5a6a4498ec2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

  - 写入并退出 `:wq`

  - 退出 `:q`  --> 打开后没做任何修改

  - 强制退出 `:q!`

    | 命令                                   | 作用                       |
    | -------------------------------------- | -------------------------- |
    | yy                                     | 拷贝当前行; 5yy向下拷贝5行 |
    | t                                      | 粘贴                       |
    | dd                                     | 删除当前行; 8dd向下删除8行 |
    | G   gg                                 | 文件尾/头                  |
    | u                                      | 撤销                       |
    | 20 shift+g                             | 光标移动到20行             |
    | **[命令行]**     /关键字               | 查找某关键字, n查找下一个  |
    | **[命令行]**     :set nu     :set nonu | 显示/不显示行号            |

- 关机 & 重启: **关机或重启之前都应先执行`sync**`

  - shutdown
    - shutdown -h now:  立即关机
    - shutdown -h 1: 1分钟之后关机
    - shutdown -r now: 立即关机
  - halt: 关机
  - rebot: 重启
  - sync: 把内存的数据同步到磁盘上(把没保存的东西保存进去)
  
  **开机的流程:**
  
  开机 -> BIOS -> /boot -> init进程1 -> 运行级别 -> 运行级别对应的服务
  
- 管道符号`|`: 将前一个命令的处理结果传递给后面的命令处理

- 如果某个指令没有, 可以使用`yum install xxx`进行安装





## 实用指令

### 运行级别

- ##### `init [12356]`: 切换到指定运行级别

**运行级别:**	配置文件 /etc/inittab

  - 0 -> 关机

  - 1 -> 单用户(找回丢失密码)

  - 2 -> 多用户无网络

  - **3 -> 多用户有网络**

  - 4 -> 系统保留

  - 5 -> 图形界面(打开CentOS是默认是这个)

  - 6 -> 重启

#### 找回丢失的root密码 

进入到单用户模式(进入单用户模式, root不需要密码就可以登陆), 修改密码

1. 引导的时候按Enter

![image.png](https://upload-images.jianshu.io/upload_images/12014150-57a465b85d909edf.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2. 按e --> 光标选择第二个kernal(编辑内核)

![image.png](https://upload-images.jianshu.io/upload_images/12014150-9b2eaa7277a61ab1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3. 输入 空格 1 Enter

![image.png](https://upload-images.jianshu.io/upload_images/12014150-75eccb76cf319188.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4. 回到引导界面, 输入b, 进行引导

![image.png](https://upload-images.jianshu.io/upload_images/12014150-b3406588eb9be0c3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

5. 这是我们就进入到单用户模式(不需要密码), 此时就可以改密码了

![image.png](https://upload-images.jianshu.io/upload_images/12014150-746a81559ece6b61.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

#### 修改默认的启动运行级别

1. `vim /etc/inittab`
2. `i`进入编辑模式
3. 将`id:5:initdefault`中的数字改为对应的即可

如果有人整你, 把默认设为0, 你还可以用上面找密码的方法设置

------

### 帮助

- ##### `man 指令`: 帮助指令(详细的文档)

- ##### `help 指令`: 帮助指令(简单的描述)

------

### 文件目录类

- ##### `pwd`: 显示当前工作目录的绝对路径

- ##### `ls [选项] [目录或文件]`: 显示信息

  - `-a`显示隐藏文件
  - `-l`显示详细信息

- ##### `cd [参数]`: 切换目录

  - `cd ~` 或 `cd`: 回到家目录
  - `cd ..`: 回到当前目录的上一级目录

- ##### `mkdir [选项] 要创建的目录`: 创建目录

  - `-p`: 一次性创建多级目录(默认只能创建一级目录)

- ##### `rmdir`: 删除空目录

- ##### `rm -rf`: 删除非空目录

- ##### `touch 文件名(可以有好几个)`: 创建空文件

- ##### `cp [选项] source dest`: 拷贝文件到指定目录

  - `-r`: 递归复制整个文件夹
  - `\cp`: 强制覆盖相同的文件, 不会提示 (当目标目录下有相同文件, 会提示是否覆盖)

- ##### `rm [选项] 文件或目录`: 删除文件或文件夹

  - `-r`: 递归的删除整个文件夹
  - `-f`: 强制删除不提示

- ##### `mv`: 移动文件与目录 或 重命名

  - `move oldNameFile newNameFile`: 重命名(可以理解为它移动的时候发现当前目录有这个文件了, 就重命名了
  - `move /temp/movefile /targetFile`: 移动文件

- ##### `cat [选项] 文件`: 以只读的方式查看文件内容

  - `-n`: 显示行号
  - 通常cat指令跟 `| more`一起连用, 一页一页的显示内容(空格换页)

- ##### `more 文件名`: 以全屏的方式按页显示文本文件的内容

  | 操作     | 功能说明                         |
  | -------- | -------------------------------- |
  | 空格     | 下翻一页                         |
  | 回车     | 向下一行                         |
  | q        | 立即离开move, 不再显示下面的内容 |
  | Ctrl + F | 向下滚动一屏                     |
  | Ctrl + B | 向前滚动一屏                     |
  | =        | 输出当前的行号                   |
  | :f       | 输出文件名和当前行的行号         |

- ##### `less 文件名`: 也是分页查看内容, 但不是一次将文件加载进来, 而是看什么才装什么, **对显示大型文件(比如<u>日志文件</u>)有较高的效率**

- ##### `>`: 输出重定向(覆盖写)

  ##### `>>`: 追加

  - `ls -l > a.txt`
  - `ls -l >> a.txt`
  - `cat 文件 > a.txt`
  - `echo "内容" >> a.txt`

- ##### `echo`: 输出内容到控制台

  - 常用于输出环境变量路径  `echo $PATH`

- ##### `head`: 显示文件的开头部分(默认是前10行)

  - `-n 5`: 前5行

- ##### `tail`: 显示文件的尾部部分

  - 跟head相同
  - `-f 文件`: **实时跟踪该文档的所有更新**   (Ctrl + C停止)

- ##### `ln -s [原文件或目录] [软链接名]`: 给原文件创建一个软链接 *(类似于windows里的连接方式)*

  - 当使用`pwd`查看目录时, 仍然看到的时软链接所在的目录*(就好像你在Windows桌面上下打开一个链接, 你还是在桌面一样)*

  - 删除软链接文件时不要加最后的 / 

    ![image.png](https://upload-images.jianshu.io/upload_images/12014150-d62a200eda8dc6f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- ##### `history`: 查看已经执行过的历史指令

  - `history 5`: 最近的5条指令
  - `!10`: 重新执行历史编号为10的指令

------

### 时间日期类

- ##### `data`: **显示当前时间日期(格式可以自定义)**
  
  - `date "+%Y"`: 显示年
  - `date "+%Y-%m-%d %H:%M:%S"`: 显示年月日时分秒
  - `-s "2019-07-29 14:46:03"`: 设置时间
- ##### `cal`: 显示当前日历信息
  
  - `cal 2019`: 显示一年的日历

------

### 搜索查找类

- ##### `find [搜索范围] [选项]`: 从指定目录向下递归遍历各个子目录, 返回满足条件的文件或目录

  - `-name [文件名]`: 按照文件名查找*(可以使用通配符)*

  - `-user [用户名]`: 按拥有者查找, 查找属于该用户的文件

  - `find / -size +20M`: 查找整个Linux系统下大于20M的文件

    (+大于, -小于,  啥也没有就是等于)
    
  - **删除某目录下10天前的.tar.gz文件**: `find 路径名 -mtime +10 -name "*.tar.gz" -exec rm -rf {} \;`

- ##### `locate [文件名]`: 利用实现建立的所有文件名及路径的locate数据库实现快速定位, 无需遍历整个文件系统, 速度快, 但要定期更新

  <u>第一次运行前, 必须使用updatedb创建locate数据库</u

- ##### `grep [选项] 文件`: 过滤查找

  - `-n`: 显示行号
  - `-i`: 忽略字母大小写
  - 一般与管道指令连用: `cat hello.c | grep return`查找hello.c的return关键词

------

### 压缩和解压缩类

- ##### `gzip/gunzip`: 压缩 和 解压缩

  - gzip压缩过文件后得到.gz压缩文件, 原文件就不保留了

- ##### `zip/unzip [选项] xx.zip 文件或文件夹`: 压缩 和 解压缩, **在项目中打包发布中很有用**

  - `zip -r 压缩包.zip 文件`: 递归压缩, 即压缩文件夹
  - `unzip -d 目录 压缩包.zip`: 指定解压后文件的存放目录

- ##### `tar [选项] xxx.tar.gz 打包的内容`: 打包指令, 打包后的文件时.tar.gz文件

  - 将多个文件打包: `tar -zcvf new.tar.gz a.txt b.txt`
  - 将整个文件夹打包: `tar -zcvf new.tar.gz 文件夹`
  - 解压时`tar -zxvf new.tar.gz`: 解压到当前目录
  - 解压到指定目录:  `tar -zxvf new.tar.gz -C 路径` (指定解压目录必须存在)
  - `-x`: 解包.tar文件
  - `-c`: 产生.tar打包文件

  -----

  - `-v`: 显示详细信息
  - `-f`: 指定压缩后的文件名
  - `-z`: 打包同时压缩

------

## 用户管理

- 用户的登陆和注销

  - 登陆的时候要少使用root账户, 应该先用普通账户登陆, 如果权限不够, 再通过`su - 用户名`切换用户
  - `logout`退出账户(在远程登陆中才有效, 直接在虚拟机的命令行里执行是没用的)

- 用户管理

  - ##### `useradd [可选项] 用户名`: 添加用户

    - 当创建用户成功后, 会自动的创建和用户同名的家目录
    - 可以通过`useradd -d`指定在哪个目录下创建用户
    - 指定密码 `passwd 用户名`
    - 用户登陆进来之后会默认到家目录中

  - ##### `userdel`: 删除用户 (**一般都保留家目录**)

    - 并保留家目录: `userdel 用户名`
    - 同时删掉用户的主目录: `userdel -r 用户名`

  - ##### `id 用户名`: 查询用户信息

    ![image.png](https://upload-images.jianshu.io/upload_images/12014150-9a945e55aa82be83.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

    用户id号, 组ID号, 组名

  - ##### `su - 用户名`: 切换用户

    回退到原先的用户: `exit`

    从高权限用户到低权限用户时不需要密码

  - ##### `whoami`: 当前是哪个用户

- 用户组

  - ##### `groupadd 组名`: 增加组
  - ##### `groupdel 组名`: 删除组
  - 增加用户式直接加上组: `useradd -g 用户组 用户名`
  - #####  `usermod -g 新的组名 用户名`: 修改用户组
  - 修改用户登陆的初始目录: `usermod -d 目录名 用户名`

- 用户和用户组相关文件

  - 用户配置文件(用户信息): /etc/passwd
  - 组配置文件(组信息): /etc/group
  - 口令配置文件(密码和登陆信息, 加密的): /etc/shadow

------

## 组管理

### 文件

查看文件的所有者, 所在组: `ls -alh`(a显示隐藏文件, l显示详细信息, h以人习惯的方式呈现)

- **所有者**: 创建文件的人自然成功文件的所有者
  - #####  `chown 用户名 文件名`: 改变文件的所有者
  - 改变文件的所有者和所有组: `chown newowner:newgroup file`
  - `-R`: 如果是目录, 则所有子文件和子目录递归生效
  
- **所在组: **用户创建文件后, 默认这个文件所在组就是该用户所在的组
  
  - ##### `chgrp 组名 文件名`: 修改文件所在组
  
- **其他组: **除文件的所有者和坐在组的用户外, 系统的其他用户都是文件的其他组

------

## 权限管理

### `ls -l` 显示内容的含义

![image.png](https://upload-images.jianshu.io/upload_images/12014150-786a3cbbdc37ce45.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**第一个 - :** 文件类型

- \- 普通文件
- d 目录
- l 软连接
- c 字符设备(键盘, 鼠标)
- b 块文件(硬盘)

***<u>其余字符三个一组*</u>**

**rw- :** 表示文件所有者拥有的权限

- 文件所有者可以 r 和 w

**r-- :** 文件所在组的用户的权限

- 只有 r 的权限

**r-- :** 文件的其他组的用户的权限

- 只有 r 的权限

**1 表示:**

- 如果是文件: 表示硬链接的数, 一般都是1
- 如果是目录: 表示该目录的子目录的个数 (隐藏文件 .代表当前目录 ..代表上级目录, 也算是子目录)

**第一个root :** 表示所有者

**第二个root :** 所有者所在的组

**0 :** 表示该文件的大小

- 当前为0个字节
- 如果是目录: 统一是4096

**8月 11 10:38 :** 文件最后的修改时间

------

### 权限

也可用数字表示: r=4, w=2, x=1

- **r**
  - 文件: 可以读取, 查看
  - 目录: 可以读取, ls查看目录内容
- **w**
  - 文件: 可以修改; 但不代表可以删除文件*(删除一个文件的前提是对该文件所在的目录有写权限)*
  - 目录: 可以在目录中创建 + 删除 + 重命名目录
- **x**(可执行文件会变成绿色)
  - 文件: 可执行
  - 目录: 可以进入该目录

------

### 修改权限

##### `chmod`

- t通过加减赋值: \+ \- =     u:所有者 g:所有组 o:其他人 a:所有人
  1. `chmod u=rwx,g=rx,o=x 文件/目录名`
  2. `chmod o+w 文件/目录名`
  3. `chmod a-x 文件/目录名`
- 通过数字变更权限 r+w+x = 4+2+1
  1. `chmod 751 文件/目录名` 等价于 `chmod u=rwx,g=rx,o=x 文件/目录名`

**例子:**

- 让别人可以进入某个文件夹: 要赋予该用户rx权限

------

## 定时任务调度

系统在某个时间执行特定命令

##### `crontab`

- `-e`: 编辑定时任务
- `-l`: 查询crondtab任务
- `-r`: 删除当前用户所有的crondtab任务
- `service crond restart`: 重启任务调度

**步骤:** 

- **简单指令:**
  1. `crontab -e`
  2. 编辑相应的指令
  3. 保存退出
- **复杂指令要定时运行脚本**
  1. 编写shell脚本
  2. 给.sh文件一个可执行权限
  3. `crontab -e`
  4. 编辑定时时间 并 调用脚本文件

**占位符说明:** 

- 第一个位置: 分钟 [0~59]
- 第二个位置: 小时 [0-~3]
- 第三个位置: 日期 [1~31]
- 第四个位置: 月份 [1~12]
- 第五个位置: 星期 [0~7] (0和7都代表星期日)

**符号说明:** 

1. `*`: 代表任何时间
   - 比如第一个位置是 * 代表一小时中的每分都执行
2. `,`: 代表不连续的时间
   - 比如`0 8,12,16 * * *`代表八点整,十二点整,十六点整执行
3. `-`: 代表连续的时间范围
   - 比如`0 5 * * 1-6`代表周一到周六的凌晨五点整执行
4. `*/n`: 代表每隔多久执行一次
   - 比如`*/10 * * * *`代表每隔十分钟执行一次

------

## 磁盘分区,挂载

##### `lsblk -f`(老师不离开) : **查看系统分区和挂载情况**

只`lsblk`可以查看到大小

![image.png](https://upload-images.jianshu.io/upload_images/12014150-b244711ab0df64d6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 虚拟机增加硬盘

任务说明: 添加一块硬盘, sdb分区下的sdb1分区, 并挂载到/home/newdisk目录中

1. 虚拟机添加硬盘

   ![image.png](https://upload-images.jianshu.io/upload_images/12014150-fa3f5049222b72a9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2. 分区

   - `fdisk /dev/sdb`

     ![image.png](https://upload-images.jianshu.io/upload_images/12014150-13854089bd9a1e21.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3. 格式化

   - `mkfs -t ext4 /dev/sdb1`

4. 挂载

   - `mount /dev/sdb1 /home/newdisk`

   > 卸载: `umount /dev/sdb1`

5. 设置永久挂载

   - `vim /etc/fstab`: 打开此文件编辑

     ![image.png](https://upload-images.jianshu.io/upload_images/12014150-8bfeb6f43f910f10.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

   - `mount -a`

------

## 磁盘情况查询

- ##### `df -lh`: 查询系统整体磁盘使用情况

- ##### `du -ach 目录`: 查询指定目录的磁盘占用情况

  - `--max-depth=1`: 子目录深度
  - `-a`: 含文件
  - `-s`: 指定目录占用大小的总和
  - `-c`: 列出明细的同时增加汇总值

- ##### `ls -l 文件夹名 | grep "^-" | wc -l`: 统计某文件夹下文件数目

  先列出来 --> 再过滤( ^- 代表以 - 开头的) --> 再统计(wc为统计)

  - `ls -lR`: 包括子文件夹里的

- `把^-换成^d`: 统计某文件夹下目录个数

  - 包括子文件夹里的

- `tree`: 树状显示当前所在目录结构

-----

## 网络配置

### 查看网络IP和网关

**修改虚拟网卡的ip地址(虚拟机的Vmnet8)**

![image.png](https://upload-images.jianshu.io/upload_images/12014150-e0c4ff33df786c13.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### `ping ip地址`: 测试主机之间网络连通性

- 自动获取

  - 缺点: 每次获取的ip地址可能不一样, 不适用于做服务器

    ![image.png](https://upload-images.jianshu.io/upload_images/12014150-506e1d71cbae4093.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
    ![image.png](https://upload-images.jianshu.io/upload_images/12014150-160f34051fd175f6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 指定固定ip: 直接修改配置文件来修改IP, 并可以连接到外网

  - 编辑 `vim /etc/sysconfig/network-scripts/ifcgf-eth0` -> 第一块网卡, 如果有很多块就是eth1.....

    ![image.png](https://upload-images.jianshu.io/upload_images/12014150-32d274887e335cd4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

  - 修改后要重启网络服务 `service network restart` 

-----

## 进程管理

- ##### `ps -aus`: 显示系统执行的进程

  - `-a`: 显示当前终端的所有进程信息
  - `-u`: 以用户的格式显示进程信息
  - `-x`: 显示后台进程运行的参数

  | 项目    | 含义                                                         |
  | ------- | ------------------------------------------------------------ |
  | USER    | 用户名称                                                     |
  | PID     | 进程号                                                       |
  | %CPU    | 进程所占用CPU百分比                                          |
  | %MEM    | 进程所占用物理内存百分比                                     |
  | VSZ     | 进程所占用虚拟内存大小(KB)                                   |
  | RSS     | 进程所占用物理内存大小(KB)                                   |
  | TTY     | 终端名称                                                     |
  | STAT    | 进程状态<br />* S: 睡眠<br />* s: 该进程是会话的先导进程<br />* N: 进程所拥有比普通优先级更低的优先级<br />* R: 正在运行<br />* D: 短暂等待<br />* z: 僵死进程<br />* T: 被跟踪或者被停职 |
  | STARTED | 进程的启动时间                                               |
  | TIME    | CPU时间(进程使用CPU的总时间)                                 |
  | COMMAND | 启动进程所用的命令和参数(太长会被截断)                       |

  - 查看父进程: `ps -ef`  (PPID代表父进程)
    - 只关心某一个进程的父进程: `ps -ef | grep xxx`
  
- ##### `kill 选项 进程号`:  终止进程

  - `-9`: 强制终止

  - **踢掉非法用户:** 

    1. 用root登陆
    2. `ps -aux | grep sshd`
    3. 找到非法用户的进程号
    4. `kill 他的PID`

    ![image.png](https://upload-images.jianshu.io/upload_images/12014150-102be96de450e4e9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

  - **终止远程登陆服务sshd:** 

    ![image.png](https://upload-images.jianshu.io/upload_images/12014150-f180eb6e51025793.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

    重启用`service sshd restart`

- ##### `killall 进程名称`: (支持通配符)

  - 如果父进程启动了很多子进程, 可以把父进程端了, 子进程也就都被杀掉了

- ##### `pstree`: 以树状展示进程信息(可以直观的看到父进程和子进程的关系)

------

### 服务管理

本质是后台进程, 通常会监听某个端口, 等待其他程序的请求, 又称为守护进程

- ##### `service 服务名 [start | stop | restart | reload | status]`
  
  - 在CentOS 7.0后使用`systemctl`
  - 这种stop是临时生效的, 系统重启过后, 又会回归到服务的默认设置
- 可以在windows下`telnet ip 端口号`检测某个端口是否在监听
- 查看服务名:
  - `setup -> xitong fuwu `
  - `/etc/init.d/`: 列出系统有那些服务
- ##### `chkconfig`: 给每个服务的运行级别设置自启动/关闭
  
  - `chkconfig --list`: 查看所有服务在各个运行级别下的状态
  - `chkconfig 服务名 --list` <=> `chkconfig --list | grep 服务名`
  - `chkconfig --level 5 服务名 on/off`: 设置某个服务在某个运行级别下是否自启动

------

### 监控进程

#### 动态监控进程

- ##### `top [选项]`: 通常用来看系统的附载 (和`ps`很相似, 不过他会动态的刷新)
  
  - `-d 秒数`: 指定属性的秒数(默认是3秒刷新)
  - `-i`: 不显示闲置或僵尸进程
  - `-p`: 通过指定监控进程ID来仅仅监控某个进程的状态
  - 交互命令:
    - `u`: 输入用户名动态监测某个用户
    - `k`: 输入PID可以kill掉这个进程
    - `q`: 退出
    - `N`: 按照PID顺序排序
    - `P`: 按照CPU使用顺序排序
    - `M`: 按照内存使用顺序排序

#### 监控网络情况

- ##### `netstat -anp`
  
  - `-an`: 按一定顺序排列输出
  - `-p`: 显示那个进程在调用

-----

## 软件包的管理

## RPM

- ##### `rpm -qa | grep xxx`: 查询某个软件是否安装

  - `-q`: 查询
  - `-a`: 查询全部
  - `-qi`: 软件信息
  - `-ql`: 查询软件包中的文件 以及 他们安装去了
  - `-qf 文件全路径`: 查询文件所属的软件包

- ##### `rpm -e 软件包名`: 卸载

  - `--nodeps`: 放弃依赖, 强制删除(不推荐)

- ##### `rpm -ivh RPM包全路径名称`: 安装

  - `-i`: 安装
  - `-v`: 提示
  - `-h`: 进度条

  **安装firefox:**

  1. 挂载CentOS的iso文件
  2. 进入到`/media/` -> 进入到`CentOS.../` -> `Packages/`
  3. 找到firefox的RPM包拷贝到`/opt`目录下: `cp firefox-45.0.1-1.el6.centos.x86_64.rpm /opt/`
  4. 切换到`/opt`
  5. `rpm -ivh firefox-45.0.1-1.el6.centos.x86_64.rpm`

------

## YUM

**使用YUM必须连网**

- ##### `yum list | grep xxx`: 查询软件在YUM服务器上有没
- ##### `yum install xxx`: 安装软件

-----


