#!/usr/bin/env bash
# ***********************************************
# @Time     : 2018/3/19 12:14
# @Author   : shaonbean@qq.com
# @Software : PyCharm
# @Blog     : http://blog.csdn.net/wh211212
# ***********************************************
#
redis_discovery () {

port=($(sudo netstat -nlput | awk -F ":" '/redis-server/ {print $0}' | awk -F: '{print $2}' | awk '{print $1}' | grep -v "^$"))

[ "${port[0]}" == "" ] && exit

    printf '{\n'
    printf '\t"data": [\n'
for((i=0;i<${#port[@]};++i))
  {
      num=$(echo $((${#port[@]}-1)))
      if [ "$i" != ${num} ];
      then
         printf "\t\t{ \n"
         printf "\t\t\"{#REDISPORT}\":\"${port[$i]}\"},\n"
      else
         printf  "\t{ \n"
         printf  "\t\t\"{#REDISPORT}\":\"${port[$num]}\"} \n"
         printf  "\t\t ] \n"
         printf "} \n"
      fi
    }
  }

case "$1" in
redis_discovery)
    redis_discovery
    ;;
*)
    echo "Usage: $0 {redis_discovery}"
    ;;
esac