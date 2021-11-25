#!/usr/bin/env bash

# Create a topic
echo "[INFO] - Creating topic my-topic"
$KAFKA_HOME/bin/kafka-topics.sh --create \
  --zookeeper localhost:2181 \
  --replication-factor 1 --partitions 13 \
  --topic my-topic

# List existing topics
echo "[INFO] - Visualizing existing topics"
$KAFKA_HOME/bin/kafka-topics.sh --list \
    --zookeeper localhost:2181

# Describe my-topic
echo "[INFO] - Getting detailed information about my-topic"
$KAFKA_HOME/bin/kafka-topics.sh --describe \
	--zookeeper localhost:2181 \
	--topic my-topic

echo "[INFO] - Deleting topic my-topic"
$KAFKA_HOME/bin/kafka-topics.sh --delete \
	--zookeeper localhost:2181 \
	--topic my-topic

# List existing topics
echo "[INFO] - Visualizing existing topics"
$KAFKA_HOME/bin/kafka-topics.sh --list \
    --zookeeper localhost:2181
