# Bitnami-Kafka Testing


## Step to Reproduce

**1. Install like Tutorial in [Readme](https://github.com/lensesio/stream-reactor).**

**2. Run Python Program in testing folder.**

```
python3 mqtt_pub.py
```

**3. Check Amount of messege with topic snoqttv5 in Kafka with The Output in the end of python program.**

The Goal is the amount of messege with topic snoqttv5 same with the output in the end of python program

**4. Change parameter.**

You can change the parameter of interval between messege to get other result in python program

```
# Param Variable
interval = 0.1
```