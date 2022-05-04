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
  --inside-color ffffff22 \
  --ring-color 0074d9 \
  --keyhl-color ff4136 \
  --bshl-color ff4136 \
  --ringver-color 01ff70 \
  --insidever-color ffffff22 \
  --verif-text 'Verifying...' \
  --wrong-text 'Fuck off'
  echo '0' > "${file}"
fi
