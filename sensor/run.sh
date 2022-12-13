#!/bin/bash

script_dir="$( dirname -- "$( readlink -f -- "$0"; )"; )"
script_path="$script_dir/run.sh"
cron_schedule="0 0 * * SUN"

if [ "$1" = "test" ]; then 
	echo "CRON RUNNER TEST PATH"
	echo $PATH
	echo $script_path
	pwd
	exit 1
fi

check_crontab(){
	if [ -z "$(crontab -l | grep $script_path)" ]; then
		echo "crontab exists"
	fi
}

unset_crontab(){
	crontab -l | grep -v $script_path | crontab -
}

set_crontab(){
	unset_crontab
	(crontab -l ; echo "$cron_schedule $script_path update-rules >> $script_dir/run.log") | crontab -
}

docker_compose_path="docker compose"

# Check if Docker Engine already installed
if ! command -v docker &>/dev/null; then
    echo "You need to install Docker to continue."
    exit 1
fi

if ! docker compose version &>/dev/null; then
	# if return > 0, set path to old docker compose
	docker_compose_path="docker-compose"
    
	# Check if old version of Docker Compose exists
    if ! command -v "$docker_compose_path" &>/dev/null; then
        echo "Docker Compose command not found."
        echo "You need to install Docker Compose command to continue."
        exit 1
    fi    
fi

docker_compose_path="${docker_compose_path} --project-directory $script_dir"

if [ "$1" = "build" ]; then
    $docker_compose_path build
elif [ "$1" = "update-rules" ]; then
    $docker_compose_path build
    $docker_compose_path up -d snort
elif [ "$1" = "set-automation" ]; then
	echo "setting crontab"
	set_crontab
elif [ "$1" = "unset-automation" ]; then
	echo "unsetting crontab"
	unset_crontab
else
    $docker_compose_path up -d
fi
