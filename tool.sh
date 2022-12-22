#!/bin/bash
read -p $'\n**************\nPS:如再次运行输入(关键字)字即可\n**************\n请输入需要安装的软件序号\n1)三网线路测试(backtrace)\n2)路由回程跟踪(besttrace)\n3)Speedtest by Ookla(speedtest)\n0)或任意键退出\n' num
add(){
[ -n $(type -p apt) ] && [ -z $(type -p curl) ] && apt-get install curl -y
[ -n $(type -p apt) ] && [ -z $(type -p unzip) ] && apt-get install unzip -y
[ -n $(type -p yum) ] && [ -z $(type -p curl) ] && yum install curl -y
[ -n $(type -p yum) ] && [ -z $(type -p unzip) ] && yum install unzip -y
}
case $num in
    1)
        if [ $(uname -m) = "x86_64" ]
        then
            add
            curl -sL -o backtrace.tar.gz https://github.com/zhanghanyun/backtrace/releases/latest/download/backtrace-linux-amd64.tar.gz
            tar -xf backtrace.tar.gz
            rm backtrace.tar.gz
            mv backtrace /usr/bin/
            echo "安装完成 输入backtrace运行程序"
        else
            add
            curl -sL -o backtrace.tar.gz  https://github.com/zhanghanyun/backtrace/releases/latest/download/backtrace-linux-arm64.tar.gz
            tar -xf backtrace.tar.gz
            rm backtrace.tar.gz
            mv backtrace /usr/bin/
            echo "安装完成 输入backtrace运行程序"
        fi
    ;;
    2)
        if [ $(uname -m) = "x86_64" ]
        then
            add
            curl -sL -o besttrace.zip https://nichen.ml/d/besttrace.zip
            unzip besttrace.zip
            chmod 771 besttrace
            mv besttrace /usr/local/bin
            echo "安装完成 输入besttrace -q1 你的ip 运行程序"
        else
            add
            curl -sL -o besttrace.zip https://nichen.ml/d/besttrace.zip
            unzip besttrace.zip
            chmod 777 besttracearm
            mv besttracearm /usr/local/bin/besttrace
            echo "安装完成 输入besttrace -q1 你的ip 运行程序"
        fi
    ;;
    3)
        if [ $(uname -m) = "x86_64" ]
        then
            add
            curl -sL -o speedtest.tgz https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz
            tar -zxf speedtest.tgz
            mv speedtest /usr/local/bin
            echo "安装完成 输入speedtest运行程序"
        else
            add
            curl -sL -o speedtest.tgz https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-aarch64.tgz
            tar -zxf speedtest.tgz
            mv speedtest /usr/local/bin
            echo "安装完成 输入speedtest运行程序"
        fi
    ;;
    *)
        echo "0|任意键|退出"
esac
