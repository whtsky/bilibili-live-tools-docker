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

- 直接拉取构建好的Docker镜像(不一定是最新的版本)

```
docker run -itd -e USER_NAME=B站登陆账户 -e USER_PASSWORD=登陆密码 --name 容器名字(随意) zsnmwy/bilibili-live-tools-docker
```
https://github.com/zsnmwy/bilibili-live-tools-docker/blob/master/Dockerfile

- 本地构建Docker镜像(自己构建最新的版本)

* Linux/Macos
    1. 构建镜像 `curl https://raw.githubusercontent.com/zsnmwy/bilibili-live-tools-docker/master/Dockerfile | docker build - -t bilibili-live-tools-docker`
    2. 运行容器 `docker run -itd -e USER_NAME=B站登陆账户 -e USER_PASSWORD=登陆密码 --name 容器名字(随意) bilibili-live-tools-docker`
* Windows
    1. [下载Dockerfile](https://raw.githubusercontent.com/zsnmwy/bilibili-live-tools-docker/master/Dockerfile)
    2. 构建镜像 `docker build . -t bilibili-live-tools-docker`
    3. 运行容器 `docker run -itd -e USER_NAME=B站登陆账户 -e USER_PASSWORD=登陆密码 --name 容器名字(随意) bilibili-live-tools-docker`
