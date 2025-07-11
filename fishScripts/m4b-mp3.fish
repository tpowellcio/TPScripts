function m4b-mp3
  for arg in $argv
  do
    ffmpeg \
    -i "$arg" \
    -acodec libmp3lame \
    -ar 22050 "$(basename $arg .m4b).mp3"
  done
end