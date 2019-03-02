#!/bin/bash

BRIGHT=0.0
CONTRAST=1.2
COLOUR=1.2

if [[ -z "${1}" ]]; then
  echo "Please specify a capture file."
  exit 1
fi

echo "Parameters for blackening noisy edges:"
echo "Horizontal position? " && read XPOS
echo "Vertical position? " && read YPOS
echo "Horizontal size? " && read XSIZE
echo "Vertical size? " && read YSIZE
echo -e "\nParameters for video format:"
echo "Frame Rate (FPS)? " && read FPS
echo "Cartoon? " && read CARTOON

if [[ "${CARTOON}" == "y" ]]; then
  FORMAT=animation
else
  FORMAT=film
fi

#FILTERS="-vf yadif=1,hqdn3d"
#FILTERS="-vf yadif=1,hqdn3d,delogo=57:46:59:53,crop=664:564:26:3,pad=720:576:26:3"
FILTERS="-vf crop=${XSIZE}:${YSIZE}:${XPOS}:${YPOS},pad=720:576:${XPOS}:${YPOS},eq=brightness=${BRIGHT}:contrast=${CONTRAST}:saturation=${COLOUR} -filter:a loudnorm -tune ${FORMAT}"

ffmpeg -i ${1} ${FILTERS} -vcodec libx264 -acodec libfdk_aac -ab 128k -r ${FPS} -aspect 4:3 ${1}_final.mp4

exit 0
