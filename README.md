# azure-rocketmq-kube-playground
run rocketmq using kubernetes

building images
===

```shellsession
$ docker build -t mikeneck/rocketmq:4.3.0 --file Dockerfile.rocketmq .
$ docker build -t mikeneck/rocketmq-name-server:4.3.0 --file Dockerfile.name-server .
$ docker build -t mikeneck/rocketmq-broker:4.3.0 --file Dockerfile.broker .
```

push images to azure
===

```shellsession
$ # create resource group
$ az group create --name myResourceGroup --location japaneast
$ # create azure container registry
$ az acr create --resource-group myResourceGroup --name acrName --sku Basic
$ # login to azure container registry
$ az acr login --name acrName
$ # get container registry server
$ export ACR_LOGIN_SERVER=`az acr list --resource-group myResourceGroup --query "[].loginServer" --output tsv`
$ # give valid tags to images
$ docker images | \
>  grep rocketmq | \
>  sed -e "s/mikeneck/$ACR_LOGIN_SERVER/g" | \
>  awk '{system("docker tag "$3 " " $1":"$2)}'
$ # push images
$ docker images | grep "$ACR_LOGIN_SERVER" | \
>  awk '{print $1":"$2}' | \
>  xargs -n1 docker push
$ # test images are on registry
$ az acr repository list --name acrName --output table
```
