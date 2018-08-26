#!/usr/bin/env bash

mkdir -p ~/logs/rocketmqlogs/
touch ~/logs/rocketmqlogs/broker.log

cd $ROCKETMQ_HOME
bin/mqbroker -n name-server:9876 &
tail -f ~/logs/rocketmqlogs/broker.log

