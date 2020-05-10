# handbrake-docker
Simple handbrake docker image that will wait for a DVD to be inserted into a drive and then atempt to rip the main feature with all audio and subtitles into a MKV file.

For this to work you need to map your DVD device to `/dev/dvd` and mount the directory you want to have the MKV files to `/dvd`


Example:
```docker run --name handbrake -d --device=/dev/sr0:/dev/dvd --volume=/rip:/dvd handbrake:latest```
