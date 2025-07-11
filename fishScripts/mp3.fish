function mp3 
  yt-dlp $argv \
    --ignore-errors \
    --embed-thumbnail \
    --convert-thumbnails jpg \
    --ppa "ffmpeg_o:ThumbnailsConvertor:-q:v 1" \
    --extract-audio \
    --audio-format mp3 \
    --audio-quality 0 \
    -o "~/Music/youtube/%(title)s.%(ext)s"
end