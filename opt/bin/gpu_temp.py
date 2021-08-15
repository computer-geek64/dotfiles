#!/usr/bin/python3 -B
# gpu_temp.py

from subprocess import Popen, PIPE


temperature = None
for line in Popen(['nvidia-smi', '-q'], stdout=PIPE, stderr=PIPE).communicate()[0].decode().split('\n'):
    if 'GPU Current Temp' in line and not temperature:
        temperature = int(line.split(': ')[-1].split(' ')[0])
        break
print(temperature)
