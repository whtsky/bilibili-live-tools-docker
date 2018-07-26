# bilibili-live-tools-docker

在steamcn上看到的推荐，发现了这款软件，不过原帖子中介绍的运行环境配置是Ubuntu的配置方式，虽然我在后面补充了CentOS的配置，觉得还是有点麻烦，在此写了一个Dockerfile进行简单部署

----
软件地址：https://github.com/yjqiang/bilibili-live-tools

----
环境
----
Docker version 18.04.0-ce

----
## 使用介绍

```
docker run -itd -e USER_NAME=B站登陆账户 -e USER_PASSWORD=登陆密码 --name 容器名字(随意) zsnmwy/bilibili-live-tools-docker
```
