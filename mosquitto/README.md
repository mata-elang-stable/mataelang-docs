# Mosquitto

This component is used by sensor to connect the event data stream publication from sensor to kafka. No additional configuration needed

## Prerequisites

- [x] Install Docker Engine
- [x] Install docker-compose

## Usage
- Copy `mosquitto.conf.example` to `mosquitto.conf`

- Start the component using docker-compose

```bash
docker-compose up -d
```

## Configurations

You can place your configuration in `mosquitto.conf` file. For the detail explanation you can go to Mosquitto.conf man page in https://mosquitto.org/man/mosquitto-conf-5.html.

## Generate password file

Run this command to generate a new user with a password. You can change the `USERNAME` and `PASSWORD` variables. The sensor will use this credential to connect to this broker. So, make sure you set the correct username and password in the sensor configuration.
```bash
docker run --rm -e USERNAME=mataelang -e PASSWORD=mataelang --entrypoint /bin/sh eclipse-mosquitto:2.0.15 -c '/usr/bin/mosquitto_passwd -c -b password_file $USERNAME $PASSWORD && cat password_file' | tee mosquitto_passwd
```

