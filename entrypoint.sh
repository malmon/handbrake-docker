#!/bin/bash
echo Starting handbrake ripper
while true
do
  LABEL=$(blkid -o value -s LABEL /dev/dvd)
  if [ -z "$LABEL" ]
  then
    sleep 5
  else
    echo Found Disk Label: $LABEL
    FILE=/dvd/$LABEL.mkv
    COMPLETE=/fished/$LABEL.mkv
    if [ -f "$COMPLETE" ] 
    then
      echo $COMPLETE already exists skipping
      eject /dev/dvd
      sleep 5
    else
      echo Starting to rip $FILE
      sleep 5
      HandBrakeCLI -f av_mkv --main-feature --all-audio --all-subtitles -i /dev/dvd -o $FILE
      echo Moving $FILE to $COMPLETE
      mv $FILE $COMPLETE
      echo Finished Ripping $COMPLETE
      eject /dev/dvd
      sleep 5
    fi
  fi
done
