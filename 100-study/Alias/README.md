# alias永久生效方法

1. vim ~/.bash_alias

2. 在其中编写别名

   > 如
   >
   > ```shell
   > # 设置jdk版本为jdk1.8
   > alias jdk8='export JAVA_HOME=$JAVA8_HOME'
   > 
   > # 快捷启动neo4j
   > alias neo4j='~/neo4j-community-3.4.15/bin/neo4j'
   > 
   > # 快捷启动gh-md-toc
   > alias toc='~/gh-md-toc'
   > ```

3. vim ~/.bash_profile   (每次启动终端时都会先运行这个脚本)

4. 在其中增加

   ```shell
   # 每次登陆自动刷新.bash_alias文件
   source ~/.bash_aliases
   ```

   
