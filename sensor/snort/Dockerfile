FROM mataelang/snort-base:3.1.47.0

COPY pulledpork.conf /usr/local/etc/pulledpork/pulledpork.conf
COPY snort.lua /usr/local/etc/snort/snort.lua
COPY local.rules /usr/local/etc/rules/local.rules

RUN pulledpork.py -c /usr/local/etc/pulledpork/pulledpork.conf

COPY start.sh /usr/local/bin/start-sensor.sh
RUN chmod u+x /usr/local/bin/start-sensor.sh

CMD [ "/usr/local/bin/start-sensor.sh" ]