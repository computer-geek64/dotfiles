#!/bin/bash
# i3lock-fancy.sh
# Depends on i3lock-color, a modern fork of i3lock

file='/home/ashish/tmp/.i3lock'
if [ ! -f "${file}" ]; then
  echo '0' > "${file}"
fi

if [[ $(cat "${file}") == '0' ]]; then
  echo '1' > "${file}"
  i3lock -n \
  --screen 1 \
  --blur 3 \
  --clock \
  --insidecolor ffffff22 \
  --ringcolor 0074d9 \
  --keyhlcolor ff4136 \
  --bshlcolor ff4136 \
  --ringvercolor 01ff70 \
  --insidevercolor ffffff22 \
  --veriftext 'Verifying...' \
  --wrongtext 'Fuck off'
  echo '0' > "${file}"
fi
