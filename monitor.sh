#!/bin/bash

v4l2-ctl -d 1 -i 1 --set-standard=5
ffplay -f video4linux2 -i /dev/video1 -vf yadif=1

exit 0
