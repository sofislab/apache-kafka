#!/bin/bash
set -e
echo "···································································································"
echo "MARTIN FABRIZZIO VILCHE - https://github.com/mvilche"
echo "···································································································"


if [ -z "$ZOOKEEPER_HOST" ]; then
echo "···································································································"
echo "VARIABLE ZOOKEEPER_HOST NO SETEADA - ERROR"
echo "···································································································"
    exit 1
fi

if [ -z "$ZOOKEEPER_PORT" ]; then
echo "···································································································"
echo "VARIABLE ZOOKEEPER_PORT NO SETEADA - ERROR"
echo "···································································································"
    exit 1
fi

export KAFKA_HEAP_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF8 -XX:+ExitOnOutOfMemoryError -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Djava.net.preferIPv4Stack=true"
ID=$(echo $RANDOM | tr -dc 0-9 | cut -c 1-3)
file=/opt/kafka/config/server.properties

sed -i -e "s/^zookeeper.connect=localhost:2181/zookeeper.connect=$ZOOKEEPER_HOST:$ZOOKEEPER_PORT/" "$file"
sed -i -e "s/^#listeners=PLAINTEXT:\/\/:9092/listeners=PLAINTEXT:\/\/0.0.0.0:9092/" "$file"
sed -i -e "s/^#advertised.listeners=PLAINTEXT:\/\/your.host.name:9092/advertised.listeners=PLAINTEXT:\/\/$HOSTNAME:9092/" "$file"
sed -i "/broker.id=/c\\broker.id=$ID" "$file"
echo "···································································································"
echo "TODAS LAS VARIABLES FUERON SETEADAS CORRECTAMENTE"
echo "···································································································"
echo "MI ID BROKER EN KAFKA ES "$ID
echo "···································································································"
echo "INICIANDO........."
sleep 10s
exec /opt/kafka/bin/kafka-server-start.sh "$@"
