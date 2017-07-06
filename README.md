# 招聘信息网说明
## 功能概述
### 1、登录注册：
账号密码要求，只允许英文和数字<br/>
将账号和密码保存到数据库中的user表中
### 2、修改密码
用户登录后，获取修改后的密码，删除后重新保存到user表中
### 3、退出登录
### 4、管理员登录
通过给定的管理员账号判断是否是管理员
### 5、浏览招聘信息
用户可浏览招聘信息，数据从news表中获取
### 6、发布招聘信息
登录后即可发布招聘信息，发布信息保存在news表中
### 7、查看信息详情
点击查看详情，即可查看单条信息详情，以及评论
### 8、发布评论
登录后即可发布评论，评论保存在comment表中
### 9、浏览评论
用户在详情页面可浏览评论
### 10、删除已发评论
用户登录后，只能删除自己已发送的评论
### 11、管理员可删除所有评论
管理员可删除所有评论<br/>

## 数据库要求
数据库类型：MySql<br/>
数据库名称：factory<br/>
数据库分别有以下表：<br/>
users<br/>
news<br/>
manager<br/>
commentid<br/>

## 各个表说明
### users表
logname，类型：varchar 长度：20 非空 `主键`<br/>
password，类型：varchar 长度：20 非空<br/>
### news表
newsid，类型：int 长度：100 非空 `主键 自增`<br/>
logname，类型：varchar 长度：20 非空 `外键`<br/>
title，类型：varchar 长度：50 非空<br/>
message，类型：varchar 长度：255 非空<br/>
newstype，类型：int 长度：20 非空<br/>
uptime，类型：varchar 长度：20 非空<br/>
contact，类型：varchar 长度：20 非空<br/>
number，类型：varchar 长度：20 非空<br/>
### manager表
managername，类型：varchar 长度：20 非空 `主键`<br/>
managerpassword，类型：varchar 长度：20 非空<br/>
### comment表
commentid，类型：int 长度：100 非空 `主键 自增`<br/>
newsid，类型：int 长度：100 非空 `外键`<br/>
logname，类型：varchar 长度：20 非空 `外键`<br/>
comment，类型：varchar 长度：255 非空<br/>

## 制作团队
组长：黄子汕（整体+后台）<br/>
组员：廖佩志（后台），马韵琪（前台），王玥（前台）<br/>
联系方式：QQ:`191997162` 邮箱：<huangzishan7162@163.com>
