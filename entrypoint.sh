#!/bin/bash
while true
do
  LABEL=$(blkid -o value -s LABEL /dev/dvd)
  if [ -z "$LABEL" ]
  then
    sleep 5
  else
    echo Found Disk Label: $LABEL
    FILE=/dvd/$LABEL.mkv
    if [ -f "$FILE" ] 
    then
      echo $FILE already exists skipping
      sleep 5
    else
      echo Starting to rip $FILE
      touch $FILE
      sleep 5
      HandBrakeCLI -f av_mkv --main-feature --all-audio --all-subtitles -i /dev/dvd -o /dvd/$LABEL
      echo Finished Ripping $FILE
    fi
  fi
done
