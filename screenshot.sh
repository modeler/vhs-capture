#!/bin/bash

TIME=0:01:30
FILENAME=$(sed "s/\..*//" <<< ${1})

if [[ -z "${1}" ]]; then
  echo "Please specify a filename to capture from."
  exit 1
fi

if [[ -n "${2}" ]]; then
  TIME="${2}"
fi

ffmpeg -ss ${TIME} -i ${1} -vf yadif=1,mcdeint=mode=extra_slow -t 0:00:00.01 ${FILENAME}.png

gimp ${FILENAME}.png &

sleep 10 && rm ${FILENAME}.png &

exit 0
