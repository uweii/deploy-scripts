#!/bin/bash
#name: status.sh
#desc: 获取程序运行状态
#date: 2020/1/9
#author: uwei

#当前脚本所在目录的路径
current_path=dirname $(readlink -f $0)

#导入application.sh
. $current_path/application.sh


#获取程序运行状态方法
function status(){
	is_running          #获取pid
	if [ $? -eq '0' ]    #返回0，表示没有运行
		echo "${app_name} is not running"
	else
		echo "${app_name} is running at pid: ${pid}"   #返回1，表示在运行
	fi
}


################程序入口#################
status
