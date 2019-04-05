#! /bin/bash

cp nodock_overrides/nginx/sites/node.template ./nodock/nginx/sites/node.template
cp nodock_overrides/node/scripts/run-nodock.sh ./nodock/node/scripts/run-nodock.sh
cd nodock
docker-compose stop
docker stop nodock_hello1_1
docker stop nodock_hello2_1
docker-compose -f docker-compose.yml -f ../nodock_overrides/docker-compose.override.yml build hello1 hello2 nginx
docker-compose -f docker-compose.yml -f ../nodock_overrides/docker-compose.override.yml up -d hello1 hello2 nginx
git reset --hard
cd ../
