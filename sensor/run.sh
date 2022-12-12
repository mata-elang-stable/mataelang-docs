#!/bin/bash

if [ $1 = "build" ]; then
	docker-compose build
elif [ $1 = "update-rules" ]; then
	docker-compose build
	docker-compose up -d snort
else
	docker-compose up
fi
