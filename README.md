ssh root@114.215.125.31

cd /home/zara_document

如果服务器有问题, 重启 thin 服务
$ps -ef | grep thin
会看到 thin 的id 号
$kill idnum

然后执行
$ bundle exec thin start -p 82 -d


