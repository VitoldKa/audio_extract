#!/bin/bash
IFS=$'\n'

#echo ${1}

# printf -v f '%q' "$1"
echo $f
f=`cygpath -w $1`
# printf -v f '%q' "$f"
echo $f
# echo $f
of=${f##*\\}
echo $of

outfile="${f}"

# -hwaccel cuvid  scale_cuda  h264_cuvid
# 		-c:a copy \
# -vf "drawtext=text='a watermark':x=10:y=H-th-10:fontfile=/pathto/font.ttf:fontsize=10:fontcolor=white:shadowcolor=black:shadowx=2:shadowy=2"
# yuv422p10le yuva444p10le 

# convert video


cmd="/cygdrive/c/bin/ffmpeg_cuda.2.exe -n -vsync 0 -threads 0 -i"
cmd="${cmd} \"${f}\""

# cmd="$cmd -map 0:a -c pcm_f32be \
# \"${outfile}\".audio.mov"

# -f segment -segment_time 00:10:00.000 -reset_timestamps 1 \
cmd="$cmd -map 0:a -c copy \
\"${outfile}\".%03d.audio.mov"

eval " $cmd"



