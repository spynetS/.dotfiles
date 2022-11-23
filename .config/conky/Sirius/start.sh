#!/bin/bash

killall conky
sleep 2s

conky -c ~/.config/conky/Sirius/Sirius.conf &> /dev/null &
conky -c ~/.config/conky/Sirius/Sirius2.conf &> /dev/null &

exit
