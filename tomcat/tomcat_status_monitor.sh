#!/bin/bash
######################################
# Usage: tomcat project status monitor
#
# Changelog:
# 2018-05-10 shaonbean@qq.com initial
######################################
# config zabbix sudo
# echo "zabbix ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/zabbix 

TOMCAT_NAME=$1
status=$2

TOMCAT_PID=`/usr/bin/ps -ef | grep "$TOMCAT_NAME" | grep "[o]rg.apache.catalina.startup.Bootstrap start" | grep -v grep | awk '{print $2}'`

jstack=`which jstack`

case $status in
     thread.num)

     # use jstack --help
     /usr/bin/sudo ${jstack} -l ${TOMCAT_PID} | grep http | grep -v grep | wc -l
     ;;

     *)
     echo "Usage: $0 {TOMCAT_NAME status[thread.num]}"
     exit 1
     ;;
esac