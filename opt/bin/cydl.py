#!/usr/bin/python3
# cydl.py

import sys


if len(sys.argv) == 1:
	exit(0)

url = sys.argv[2]
command = "youtube-dl \'" + url + "\' "
args = []

i = 3
while i < len(sys.argv):
	if sys.argv[i] == "-H":
		i += 1
		if sys.argv[i].lower().startswith("user-agent"):
			args.append("--user-agent")
		else:
			args.append("--add-header")
		args.append("\'" + sys.argv[i] + "\'")
	i += 1

print(command + " ".join(args) + " -o ")
