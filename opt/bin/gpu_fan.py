#!/usr/bin/python3 -B
# gpu_fan.py

from subprocess import Popen, PIPE


fan_speed = None
for line in Popen(['nvidia-smi', '-q'], stdout=PIPE, stderr=PIPE).communicate()[0].decode().split('\n'):
    if 'Fan Speed' in line and not fan_speed:
        fan_speed = int(line.split(': ')[-1].split(' ')[0])
        break
print(fan_speed)
