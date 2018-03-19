# 本机测试监控redis取值情况

# 配置zabbix账户具有sudo权限

```bash
echo "zabbix  ALL=(ALL)      NOPASSWD: ALL" > /etc/sudoers.d/zabbix
```

> 注：zabbix账户如果权限不够报错如下：sudo: no tty present and no askpass program specified

```bash
#

[root@aniu-cache-01 ~]# zabbix_get -s 127.0.0.1 -p 10050 -k "redis.port.discovery"
{
        "data": [
        { 
                "{#REDISPORT}":"6379"} 
                 ] 
}

zabbix_get -s 127.0.0.1 -p 10050 -k redis.status[6379,role]

zabbix_get -s 127.0.0.1 -p 10050 -k redis.ping[6379]                  

```

> 注：如果本机取值，没问题，添加redis监控模板到服务端，查看redis相关监控项