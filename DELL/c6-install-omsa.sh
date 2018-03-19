#!/usr/bin/env bash
# ***********************************************
# @Time     : 2018/3/19 11:37
# @Author   : shaonbean@qq.com
# @Software : PyCharm
# @Blog     : http://blog.csdn.net/wh211212
# ***********************************************
# 安装omsa监控dell服务器硬件信息
# 参考：http://blog.csdn.net/wh211212/article/details/70014141
yum update -y && yum install wget -y
wget -q -O - http://linux.dell.com/repo/hardware/latest/bootstrap.cgi | bash

yum -y install OpenIPMI && yum install srvadmin-all -y

ln -s /opt/dell/srvadmin/sbin/omreport /usr/bin/omreport
ln -s /opt/dell/srvadmin/sbin/omconfig /usr/bin/omconfig

/etc/init.d/dataeng start
chkconfig dataeng on