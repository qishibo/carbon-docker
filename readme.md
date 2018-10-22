# docker环境下的 Carbon 论坛

> carbon仓库里也有Dockerfile, 但是不好使,, 于是乎自己做了个。。开箱即用



首次访问时需要填入数据库配置进行初始化安装，如下即可

|设置项|值|
|--|--|
|Database Host|localhost|
|Database Name|carbon|
|Database Account|root|
|Database Password|root|

![安装时数据库配置](http://7xsudm.com1.z0.glb.clouddn.com/71405cably1fmpbanzj4ej20jc0g00tr.jpg)



## Install From DockerHub

```
docker pull qii404/carbon-docker:latest
sudo docker run -itd -p8080:8080 --privileged --name carbon-docker qii404/carbon-docker:latest
```

then view [http://localhost:8080/](http://localhost:8080/) click "Install" to install

Enjoy it!



## Build Image Yourself (if you want)

```
cd carbon-docker;
docker build -t carbon-docker:1.0 .

sudo docker run -itd -p8080:8080 --privileged --name carbon-docker carbon-docker:1.0
```

then view [http://localhost:8080/](http://localhost:8080/) click "Install" to install

Enjoy it!



## Docker Load

```
docker load -i carbon-docker.tar
docker run -itd -p8080:8080 -p3306:3306 --name carbon-docker carbon-docker:1.0
```

then view [http://localhost:8080/](http://localhost:8080/) click "Install" to install

Enjoy it!
