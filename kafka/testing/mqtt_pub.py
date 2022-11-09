import json
import time
import paho.mqtt.client as mqtt

MQTT = "172.17.0.1"
topic = "snoqttv5"
device_id = "Testing"
company = "MataElang-Dev"

snort_mqtt = mqtt.Client()
snort_mqtt.connect(str(MQTT))
snort_mqtt.loop_start()


def main():
    # Opening JSON file
    f = open('alert_json_2.json')

    # returns JSON object as
    # a dictionary
    data = json.load(f)

    count = 0
    start_time = time.time()
    
    # Param Variable
    interval = 0.1

    # Iterating through the json
    # list
    for i in data:
        count += 1
        snort_mqtt.publish(topic, json.dumps(i))
        time.sleep(interval)

    duration = (time.time() - start_time)
    
    # Closing file
    f.close()
    print("Total Message Send: ", count)
    print("Interval between Msg: ",  interval)
    print("Total Duration: ", duration)

if __name__ == '__main__':
    main()
