#!/bin/sh

cd ./_posts/
nohup fswatch -o *.md | xargs -n1 -I{} sh ../gitpush.sh >> /tmp/github.io.csv &

#jobs 查看后台运行的任务
#fg 1 将任务调回到前台运行 1是任务的作业号 调回前台后就可以 com+c 退出
#fswatch mac系统下的文件监听工具 好像只支持父目录, 
# fswatch -o *.md 监听当前目录下*.md文件
# fswatch 和 xargs 一起使用,实现fswatch监听到文件变化后执行其他命令 
# (fswatch -o *.md | xargs -n1 -I{} sh ../gitpush.sh)
# nohup command & 后台执行命令, &为nohup命令的结束
# nohup command > data.txt & 将 command 中的终端输出转存到data.txt文件中
# killall fswatch xargs 将进程全部kill
# mac 开机shell自启动(略)
# mac 下自动关闭终端
#选择 shell 退出后关闭窗口：终端-偏好设置-描述文件-shell-当 shell 退出时。改下面为关闭窗口就可以了