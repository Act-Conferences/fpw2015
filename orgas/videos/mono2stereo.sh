#!/bin/bash 

#ffmpeg -i rtmp://myIp:1935/live/stream1 -i rtmp://myIp:1935/live/stream2 -codec:a aac -strict -2 -filter_complex "[0:a][1:a]amerge" -f flv rtmp://myIp:1935/live/myStream

in=$1
out=${1/.mpeg/-2.mpeg}

ffmpeg -i $in -codec:a mp2 -strict -2 -filter_complex [0:a][0:a]amerge -codec:v copy $out

#echo ffmpeg -i $in -i $in -codec:a mp2  -strict -2 -filter_complex "[0:a][1:a]amerge" -codec:v copy $out


