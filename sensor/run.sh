#!/bin/bash

if [ "$1" = "test" ]; then 
	echo "CRON RUNNER TEST PATH"
	echo $PATH
	exit 1
fi

docker_compose_path="docker compose"

# Check if Docker Engine already installed
if ! command -v docker &>/dev/null; then
    echo "You need to install Docker to continue."
    exit 1
fi

if ! docker compose version &>/dev/null; then
    # Check if old version of Docker Compose exists
    if ! command -v "$docker_compose_path" &>/dev/null; then
        echo "Docker Compose command not found."
        echo "You need to install Docker Compose command to continue."
        exit 1
    fi

    docker_compose_path="docker-compose"
fi

if [ "$1" = "build" ]; then
    $docker_compose_path build
elif [ "$1" = "update-rules" ]; then
    $docker_compose_path build
    $docker_compose_path up -d snort
elif [ "$1" = "set-automation" ]; then
	
elif [ "$1" = "unset-automation" ]; then

else
    $docker_compose_path up -d
fi
