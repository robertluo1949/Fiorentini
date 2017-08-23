#!/bin/bash
###title :搭建jenkins + gerrit 
###
###
#####centos7.1 yum 的操作清除缓存###############
yum的使用 ,清除缓存
yum clean all  
yum makecache

yum localinstall *.rpm 
#####centos7.1 yum 的操作清除缓存###############

#####centos7.1 yum 的安装python-pip###############
 ##1   查看系统是否有
 pip --version  
 ###2  安装依赖和pip
 yum -y install epel-release
 yum install python-pip

 ####3 验证成功显示pip 版本号
 pip --version
 
[root@reboertcentos ~]# pip --version
pip 9.0.1 from /usr/lib/python2.7/site-packages (python 2.7)
#####centos7.1 yum 的安装python-pip###############


######修改主机名
###3.要同时修改所有三个主机名：静态、瞬态和灵活主机名：
[root@localhost ~]# hostnamectl set-hostname Linuxidc
[root@localhost ~]# hostnamectl --pretty
Linuxidc
[root@localhost ~]# hostnamectl --static
Linuxidc
[root@localhost ~]# hostnamectl --transient
Linuxidc


#####centos7.1安装mysql5.6###############
##检查linux版本
[admin@server ~]$ cat /etc/redhat-release
CentOS Linux release 7.1.1503 (Core)

##加入yum的repo
[root@iZ28gvqe4biZ ~]# rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
##yum的repo开启mysql
[root@iZ28gvqe4biZ ~]# yum repolist enabled | grep "mysql.*-community.*"
##在线安装mysql [如果下载慢，可以取消重新下载再安装]
[root@iZ28gvqe4biZ ~]# yum -y install mysql-community-server
##允许mysqld服务启动
[root@iZ28gvqe4biZ ~]# systemctl enable mysqld
##启动mysqld服务
[root@iZ28gvqe4biZ ~]# systemctl start mysqld
##重置密码
[root@iZ28gvqe4biZ ~]# mysql_secure_installation

##创建数据库实例reviewdb设置字符集
mysql> create database reviewdb DEFAULT CHARSET utf8 COLLATE utf8_general_ci; 
###创建数据库用户admin[先会删除用户admin]
mysql> drop user admin;
mysql> create user 'admin'@'%' identified by '123456';
###给用户admin赋权限[本地连接]+[远程连接]
mysql> grant all privileges on `reviewdb`.* to 'admin'@'%' identified by '123456'; 
mysql> grant all privileges on `reviewdb`.* to 'admin'@'localhost' identified by '123456'; 
###更新权限
mysql> flush privileges;  
##参考网址  http://www.cnblogs.com/XBlack/p/5178758.html
#####centos7.1安装mysql5.6###############
