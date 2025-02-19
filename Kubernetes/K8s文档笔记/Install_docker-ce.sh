```
#!/bin/bash
#this script is for Install the lastest version of docker-ce

#卸载旧版本docker
yum remove -y docker-ce
rm -rf /var/lib/docker

#安装依赖软件包
yum install -y yum-utils \
	device-mapper-persistent-data \
	lvm2 \
	git
	
#导入yum源	
yum-config-manager \
    --add-repo \
    http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

#安装docker
#yum install docker-ce -y

#安装特定版本docker
yum install -y docker-ce-18.06.1.ce-3.el7

#启动docker
systemctl start docker && systemctl enable docker

#配置镜像加速

##修改内核参数
cat >> /etc/sysctl.conf << EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl -p

##配置阿里云镜像加速
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://uyah70su.mirror.aliyuncs.com"]
}
EOF

##配置daocloud镜像加速
#curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f1361db2.m.daocloud.io >> /dev/null

##重启docker服务
systemctl daemon-reload && systemctl restart docker.service

#查看docker版本
echo
echo "##########################Docker版本###############################"
docker --version
```