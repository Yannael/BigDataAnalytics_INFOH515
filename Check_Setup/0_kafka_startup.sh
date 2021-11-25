#!/bin/bash

echo "[INFO] - Starting Zookeper and Kafka"
echo "[INFO] - Zookeeper logs are available at $HOME/zookeeper.log"
echo "[INFO] - Kafka logs are available at $HOME/kafka.log"
nohup $KAFKA_HOME/bin/zookeeper-server-start.sh $KAFKA_HOME/config/zookeeper.properties  > $HOME/zookeeper.log 2>&1 &
nohup $KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties > $HOME/kafka.log 2>&1 &
