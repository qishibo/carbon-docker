# Carbon-Forum in docker | docker环境下的carbon论坛

> carbon仓库里也有Dockerfile, 但是不好使,, 于是乎自己做了个


## Install From DockerHub

```
docker pull qii404/carbon-docker:1.0
docker run -itd -p8080:8080 -p3306:3306 --name carbon-docker carbon-docker:1.0
```

then view [localhost:8080/install](localhost:8080/install) click "Install" to install

Enjoy it!


## Build Image Yourself (if you want)

```
cd carbon-docker;
docker build -t carbon-docker:1.0 .

docker run -itd -p8080:8080 -p3306:3306 --name carbon-docker carbon-docker:1.0
```

then view [localhost:8080/install](localhost:8080/install) click "Install" to install

Enjoy it!


## Docker Load

```
docker load -i carbon-docker.tar
docker run -itd -p8080:8080 -p3306:3306 --name carbon-docker carbon-docker:1.0
```

then view [localhost:8080/install](localhost:8080/install) click "Install" to install

Enjoy it!
