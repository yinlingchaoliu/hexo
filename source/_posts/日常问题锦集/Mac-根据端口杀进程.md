---
title: Mac-根据端口杀进程
date: 2020-05-26 10:55:48
categories:
- 日常问题锦集
---
根据端口查进程
 lsof  -i :4000

```
yingzi:blog chentong$ lsof  -i :4000
COMMAND   PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
node    79748 chentong   40u  IPv4 0xc0817c4a2f69df89      0t0  TCP *:terabase (LISTEN)
```
杀掉指定进程
```
kill -9  79748
```
