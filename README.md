ssh root@114.215.125.31

cd /home/zara_document

如果服务器有问题, 重启 thin 服务
$ps -ef | grep thin
会看到 thin 的id 号
$kill idnum

然后执行
$ bundle exec thin start -p 82 -d
$ bundle exec thin start -p 83 -d 测试


如果要使用82端口，必须用root来启动thin
可以直接使用root账号。
目前使用的是普通账号，而且使用了rvm，所以可以通过`rvmsudo thin start -p 82 -d`来启动。