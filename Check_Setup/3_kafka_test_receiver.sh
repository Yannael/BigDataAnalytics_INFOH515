#!/usr/bin/env bash

echo "[INFO] - Start consumer console"
echo "[INFO] - The messages sent from the receiver should be visualized here"
$KAFKA_HOME/bin/kafka-console-consumer.sh \
    --bootstrap-server localhost:9092 \
    --topic test-send-receive \
    --from-beginning

