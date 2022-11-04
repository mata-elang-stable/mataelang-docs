#!/bin/sh

/usr/local/bin/snort -c /usr/local/etc/snort/snort.lua -s 65535 -m 0x1b -k none -l /var/log/snort -u snort -g snort --plugin-path=/usr/local/etc/so_rules/ -i $NETWORK_INTERFACE