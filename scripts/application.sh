#!/bin/bash
#name: application.sh
#desc: 应用相关信息
#dete: 2020/1/9
#author: uwei

#当前脚本所在文件夹路径
current_path=dirname $(readlink -f $0)

#应用名称
app_name="demo.jar"

#应用位置
app_path=$current_path/project/$app_name

#应用运行的pid
pid=''

#判断jar包是否在运行
#jar如果在运行返回1，否则返回0
function is_running(){
	pid=`ps aux|grep ${app_name}|grep -v grep|awk '{print $2}'` #获取jar包运行的pid
	if [ -z $pid ] ;then  #如果pid的长度为空，说明没有在运行
			return 0
	else
			return 1
	fi
}

#启动jar包,启动成功返回1，否则返回0
function start(){
	#先判断jar有没有在运行
	is_running
	if [ $? -eq "0" ]; then #没有运行，就使用nohup命令启动
		nohup java -jar $app_path > /dev/null 2>&1 &
		return 1
	else
		return 0
	fi
}

#停止jar包，停止成功返回1，否则返回0
function stop(){
	#先判断jar是否在运行
	is_running
	if [ $? -eq '0' ]; then
		return 0  #jar没有运行，停止失败
	else
		kill -9 $pid  #jar在运行，使用kill命令停止
		return 1
	fi
}


