# azure-rocketmq-kube-playground
run rocketmq using kubernetes

building images
===

```shellsession
$ docker build -t mikeneck/rocketmq:4.3.0 --file Dockerfile.rocketmq .
$ docker build -t mikeneck/rocketmq-name-server:4.3.0 --file Dockerfile.name-server .
$ docker build -t mikeneck/rocketmq-broker:4.3.0 --file Dockerfile.broker .
```


