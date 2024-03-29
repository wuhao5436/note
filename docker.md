# docker 学习

## 基础

### 安装
1. win10 下启动docker 程序-> 应用和功能 -> 最下方 程序和功能 -> 启动或关闭windows 功能 -> Hyper -V
1. 下载  `http://get.daocloud.io/#install-docker-for-mac-windows`
1. 设置 Daemon registry-mirrors 加快下载速度
1. 基础教程 `https://www.runoob.com/docker/docker-install-nginx.html` 

### docker 修改源
在mac下可以点击控制docker设置，编辑json即可
```
sudo vi  etc/docker/daemon.json编辑文件
 {
  "registry-mirrors": [ "http://hub-mirror.c.163.com"] }
 }
```
查看是否配置成功
cmd 中 `docker info` 中查看 `Registry Mirrors` 配置


### docker ps

- `docker ps -a`  查看全部的出容器
- `docker stop HASH` 停止容器
- `docker rm HASH` 移除容器

# docker-compose 操作 
- 在docker-compose.yml 目录下
- docker stop 容器名，容器名为空 会停止docker-compose.yml所构建的容器
- docker-compose ps 查看状态
- docker-compose rm CONTAINER_NAME 
- docker-compose up -d 重新构建

# 通用操作
- docker restart 重启
- docker ps 查看容器
- docker inspect xxx(容器hash)，查看信息，关键的信息有一个ipAddress相当于在你本机启动了一个虚拟的网络。
- docker stop CONTAINER_NAME 停止容器
- docker rm CONTANINER_NAME 移除容器
- docker exec -it hash /bin/xx 进入容器

### 其他命令
1. 测试在nginx中浏览html `docker cp index.html HASH://usr/share/nginx/html`
1. `docker images` 查看本地镜像
1. `docker commit -m 'some message' HASH AA:BB` AA 容器名称 BB tag名称


### docker helper

- doker helper 是分三级的，可以在不同的命令后面加helper查看帮助

  ```shell
  docker --help
  docker ps --help
  docker contianer rm --help
  ```
  
## 应用
 ### docker 安装 mysql
 https://www.cnblogs.com/jiefu/p/12204555.html
 
### docker 安装 nginx
1. `docker pull nginx:latest` 安装nginx 最新版本
1. `docker images` 查看nginx 是否安装成功
1. `docker run --name nginx-test -p 8080:80 -d nginx` 运行容器  
  * `--name` 容器名称
  * `-p` 映射地址:容器内的地址
  * `-d` 设置容器在后台运行
1. 浏览 `localhost:8080` 可以看到nginx的页面
  

