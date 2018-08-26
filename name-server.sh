#!/usr/bin/env bash

mkdir -p ~/logs/rocketmqlogs/
touch ~/logs/rocketmqlogs/namesrv.log

cd $ROCKETMQ_HOME
bin/mqnamesrv &
tail -f ~/logs/rocketmqlogs/namesrv.log

