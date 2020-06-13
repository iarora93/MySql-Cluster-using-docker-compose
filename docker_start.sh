#!/bin/bash

docker-compose down
rm -rf ./master1/data/*
rm -rf ./master2/data/*
docker-compose build
docker-compose up -d

sleep 20
