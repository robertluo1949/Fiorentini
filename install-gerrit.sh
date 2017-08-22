
yum的使用 ,清除缓存
yum clean all  
yum makecache

yum localinstall *.rpm 


修改主机名
3.要同时修改所有三个主机名：静态、瞬态和灵活主机名：
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

mysql> create database reviewdb DEFAULT CHARSET utf8 COLLATE utf8_general_ci; 
mysql> drop user admin;
mysql> create user 'admin'@'%' identified by '123456';

mysql> grant all privileges on `reviewdb`.* to 'admin'@'%' identified by '123456'; 
mysql> grant all privileges on `reviewdb`.* to 'admin'@'localhost' identified by '123456'; 
mysql> flush privileges;  
##参考网址  http://www.cnblogs.com/XBlack/p/5178758.html
#####centos7.1安装mysql5.6###############