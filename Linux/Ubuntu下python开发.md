[TOC]

## 软件包管理

### 常用指令

```bash
sudo apt-get upgrade
sudo apt-get install package
sudo apt-get remove package
sudo apt-cache show package		# 获取包的相关信息(说明,大小,版本等)
sudo apt-get source package		# 下载该包的源代码
```

### 更新软件下载地址

1. 备份Ubuntu默认的源地址: `/etc/apt/sources.list`

   ```bash
   cd /etc/apt/
   sudo cp sources.list sources.list.bak
   ```

2. 清空原文件

   ```bash
   su root 
   echo '' > sources.list		# 便捷清空方式(sudo不行,必须要切成root
   ```

3. 更新源服务器列表

   - 复制清华大学的镜像站中的内容`https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/`

   - 粘贴到`sources.list`文件中

4. 更新软件列表

   ```bash
   sudo apt-get update
   ```

   

## 从Linux系统客户机远程登陆Linux系统服务机

- 首先要再客户机上安装openssh-server

- ```bash
  ssh 用户名@ip地址
  ```

