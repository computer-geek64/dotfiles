#!/bin/bash
# i3lock-fancy.sh
# Depends on i3lock-color, a modern fork of i3lock

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
