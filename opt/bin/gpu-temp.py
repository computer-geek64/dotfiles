#!/usr/bin/python3 -B
# gpu-temp.py

from subprocess import Popen, PIPE


temperature = None
fan_speed = None
for line in Popen(['nvidia-smi', '-q'], stdout=PIPE, stderr=PIPE).communicate()[0].decode().split('\n'):
    if 'GPU Current Temp' in line and not temperature:
        temperature = int(line.split(': ')[-1].split(' ')[0])
    elif 'Fan Speed' in line and not fan_speed:
        fan_speed = int(line.split(': ')[-1].split(' ')[0])
print(temperature)

if temperature < 50 and fan_speed < 20:
    # Keep fan speed the same
    pass
elif temperature < 30:
    # Decrease fan speed by 20%
    fan_speed = fan_speed - 20 if fan_speed - 20 > 18 else 18
    Popen(['nvidia-settings', '-a', '[fan:0]/GPUTargetFanSpeed={fan_speed}'.format(fan_speed=fan_speed)], stdout=PIPE, stderr=PIPE).wait()
elif temperature < 35:
    # Decrease fan speed by 10%
    fan_speed = fan_speed - 10 if fan_speed - 10 > 18 else 18
    Popen(['nvidia-settings', '-a', '[fan:0]/GPUTargetFanSpeed={fan_speed}'.format(fan_speed=fan_speed)], stdout=PIPE, stderr=PIPE).wait()
elif temperature < 40:
    # Decrease fan speed by 5%
    fan_speed = fan_speed - 5 if fan_speed - 5 > 18 else 18
    Popen(['nvidia-settings', '-a', '[fan:0]/GPUTargetFanSpeed={fan_speed}'.format(fan_speed=fan_speed)], stdout=PIPE, stderr=PIPE).wait()
elif temperature < 60:
    # Keep fan speed the same
    pass
#elif temperature < 60:
#    # Increase fan speed by 5%
#    fan_speed = fan_speed + 5 if fan_speed + 5 < 100 else 100
#    Popen(['nvidia-settings', '-a', '[fan:0]/GPUTargetFanSpeed={fan_speed}'.format(fan_speed=fan_speed)], stdout=PIPE, stderr=PIPE).wait()
elif temperature < 70:
    # Increase fan speed by 10%
    fan_speed = fan_speed + 10 if fan_speed + 10 < 100 else 100
    Popen(['nvidia-settings', '-a', '[fan:0]/GPUTargetFanSpeed={fan_speed}'.format(fan_speed=fan_speed)], stdout=PIPE, stderr=PIPE).wait()
elif temperature < 80:
    # Increase fan speed by 20%
    fan_speed = fan_speed + 20 if fan_speed + 20 < 100 else 100
    Popen(['nvidia-settings', '-a', '[fan:0]/GPUTargetFanSpeed={fan_speed}'.format(fan_speed=fan_speed)], stdout=PIPE, stderr=PIPE).wait()
elif temperature < 90:
    # Increase fan speed by 40%
    fan_speed = fan_speed + 40 if fan_speed + 40 < 100 else 100
    Popen(['nvidia-settings', '-a', '[fan:0]/GPUTargetFanSpeed={fan_speed}'.format(fan_speed=fan_speed)], stdout=PIPE, stderr=PIPE).wait()
else:
    # Critical temperature, set fan speed to maximum
    fan_speed = 100
    Popen(['nvidia-settings', '-a', '[fan:0]/GPUTargetFanSpeed={fan_speed}'.format(fan_speed=fan_speed)], stdout=PIPE, stderr=PIPE).wait()

