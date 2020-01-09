#!/bin/bash
#name: stop.sh
#desc: 程序暂停脚本
#date: 2020/1/9
#author: uwei

#当前脚本所在目录的路径
current_path=`dirname $(readlink -f $0)`

#导入application.sh
. $current_path/application.sh


#暂定方法
function stop_app(){
	stop
	if [ $? -eq '0' ]; then									#如果暂停失败
		echo "${app_name} is NOT running"     #程序没有在运行
	else
		echo "${app_name} has benn stopped"。 #成功停止
	fi
}


#############程序入口###############
stop_app
