#!/usr/bin/env bash

# Create a topic
echo "[INFO] - Creating topic test-send-receive"
$KAFKA_HOME/bin/kafka-topics.sh --create \
  --zookeeper localhost:2181 \
  --replication-factor 1 --partitions 13 \
  --topic test-send-receive

echo "[INFO] - Start producer console"
echo "[INFO] - Type a message and press Enter to send to the receiver"
# Start the producer console
$KAFKA_HOME/bin/kafka-console-producer.sh \
    --broker-list localhost:9092 \
    --topic test-send-receive
