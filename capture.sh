#!/bin/bash

LENGTH=0:00:10

if [[ -z "${1}" ]]; then
  echo "Please specify a filename to capture to."
  exit 1
fi

if [[ -n "${2}" ]]; then
  LENGTH="${2}"
fi

v4l2-ctl -d 1 --set-ctrl=mute=0 -i 1
ffmpeg -i /dev/video1 -f rawvideo -f alsa -i hw:2 -vcodec copy -acodec copy -t ${LENGTH} ${1}.mkv

./transcode.sh ${1}

exit 0
