## ***一。首先安装jenkins。***

###     **1。安装jdk8**

​		A.mkdir /usr/java

​		B. 上传jdk-8u181-linux-x64.tar.gz

​		C.解压 jdk-8u181-linux-x64.tar.gz ,然后配置环境变量:

​			

```bash
JAVA_HOME=/usr/java/jdk1.8.0_181
JRE_HOME=/usr/java/jdk1.8.0_181/jre
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
export JAVA_HOME JRE_HOME PATH CLASSPATH
```

```bash
source /etc/profie
```

###  **2。安装Maven**

​	1。下载 Maven安装包

​			apache-maven-3.6.3-bin.tar.gz

​	2. 解压安装包

​			tar -zxvf apache-maven-3.6.3-bin.tar.gz

​    3.配置环境变量

```bash
export M2_HOME=/root/workspace/software/apache-maven-3.6.3
export MAVEN_OPTS=-Xms256m-Xmx512m
export PATH=$PATH:$M2_HOME/bin
```
### 3 .安装Git

​	1.安装

​           yum install git

 2. git --version

 3. ```bash
    git config --global user.name="RoymaGuan"
    git config --global user.email "1550829392@qq.com"
    ```

4。安装Jenkins

​	第一种方法  ：使用国内镜像来安装Jenkins

​    

```bash
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/redhat-stable/jenkins-2.164.2-1.1.noarch.rpm

rpm -ivh jenkins-2.164.2-1.1.noarch.rpm
```

5.启动Jenkins

​	

```bash
sudo systemctl start jenkins
sudo systemctl enable jenkins
```

  为Jenkins开启防火墙端口8080

```bash
# 检查防火墙配置
sudo firewall-cmd --list-all
# 开启8080端口
sudo firewall-cmd --zone=public --add-port=8080/tcp 
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
# 重新加载防火墙配置
sudo firewall-cmd --reload

```

运行`sudo more /var/lib/jenkins/secrets/initialAdminPassword`，复制Jenkins初始密码，输入到Jenkins的Getting Started页面来Unlock Jenkins。	

​	第二种方法： 官网下载 jenkins.war包

​		然后使用 nohup java -jar jenkins.war --httpPort=8080 &进行后台启动，接着将初始密码输入到Getting Started来Unlock Jenkins。

​		hook 还有 gitlab插件 Jenkin需要下载.