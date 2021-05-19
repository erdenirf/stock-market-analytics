#!/bin/bash

. $(dirname $0)/functions.sh

DIR=$(readlink -e $(dirname $0))
PROJECT_DIR="/stockanalytics"

docker network create --gateway 172.27.0.1 --subnet 172.27.0.0/24 stock_analytics
docker-compose -f ${DIR}/../docker-compose.yml up -d
pg -u postgres psql -h localhost -U postgres -f /docker-entrypoint-initdb.d/create_db.sql
echo 'Waiting kafka...'
sleep 100
docker-compose -f ${DIR}/../docker-compose.yml exec kafka kafka-topics --zookeeper zookeeper:2181 --create --replication-factor 1 --partitions 1 --topic my_test3
docker-compose -f ${DIR}/../docker-compose.yml exec kafka kafka-topics --zookeeper zookeeper:2181 --create --replication-factor 1 --partitions 1 --topic my_test4
# docker-compose exec -T elasticsearch bin/elasticsearch-setup-passwords auto --batch
