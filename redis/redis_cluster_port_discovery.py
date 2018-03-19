# -*- coding: utf-8 -*-
# @Time     : 2018/3/19 12:16
# @Author   : shaonbean@qq.com
# @Software : PyCharm
# @Blog     : http://blog.csdn.net/wh211212

import os
#import json
import simplejson as json
t=os.popen(""" sudo ps -ef | grep '\[cluster\]' | grep -v grep | awk '{print $(NF-1)}' | cut -d: -f2 """)
ports = []
for port in  t.readlines():
        r = os.path.basename(port.strip())
        ports += [{'{#REDISPORT}':r}]
t.close()
print json.dumps({'data':ports},sort_keys=True,indent=4,separators=(',',':'))