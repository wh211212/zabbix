#命令可以查看当前系统中安装的软件和硬件组件的综合摘要。
omreport system summary
#CMOS电池状态
omreport chassis batteries
#风扇状态
omreport chassis fans
#内存状态
omreport chassis memory
#网卡状态
omreport chassis nics
#CPU状态
omreport chassis processors
#温度状态
omreport chassis temps
#硬盘状态
omreport storage pdisk controller=0
#电源状态
omreport chassis pwrsupplies
#raid 状态
omreport storage vdisk controller=0