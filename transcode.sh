#!/bin/bash

FILTERS="-vf yadif=1,hqdn3d"

ffmpeg -i ${1}.mkv ${FILTERS} -vcodec libx264 -crf 18 -acodec libfdk_aac -ab 256k -aspect 4:3 ${1}.mp4

ln -s ${pwd}/${1}.mp4 /opt && minidlnad -R
systemctl isolate multi-user.target
systemctl restart minidlna

exit 0
