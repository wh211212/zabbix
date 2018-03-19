# -*- coding: utf-8 -*-
# @Time     : 2018/3/19 12:15
# @Author   : shaonbean@qq.com
# @Software : PyCharm
# @Blog     : http://blog.csdn.net/wh211212
import os
import simplejson as json
t=os.popen("""sudo netstat -nltp | grep redis-server | grep 0.0.0.0 | awk '{print $4}' | awk -F: '{print $2}' """)
ports = []
for port in  t.readlines():
        r = os.path.basename(port.strip())
        ports += [{'{#REDISPORT}':r}]
t.close()
print json.dumps({'data':ports},sort_keys=True,indent=4,separators=(',',':'))