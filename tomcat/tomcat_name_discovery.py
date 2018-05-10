#!/usr/bin/env python 
# -*- coding: UTF-8 -*-
import os
import subprocess
import simplejson as json

TOMCAT_HOME="/data/tomcats"

# TOMCAT_NAME 自定义项目运行的tomcat的目录名称

#TOMCAT_NAME="/bin/find 'TOMCAT_HOME' -name 'server.xml' | sort -n | uniq -c | awk -F'/' '{print $4}'"
TOMCAT_NAME="/bin/find /data/tomcats -name 'server.xml' | sort -n | uniq -c | awk -F'/' '{print $4}'"

#t=subprocess.Popen(args,shell=True,stdout=subprocess.PIPE).communicate()[0]
t=subprocess.Popen(TOMCAT_NAME,shell=True,stdout=subprocess.PIPE).communicate()[0]

tomcats=[]

for tomcat in t.split('\n'):
    if len(tomcat) != 0:
        tomcats.append({'{#TOMCAT_NAME}':tomcat})

# 打印出zabbix可识别的json格式
print json.dumps({'data':tomcats},sort_keys=True,indent=4,separators=(',',':'))
