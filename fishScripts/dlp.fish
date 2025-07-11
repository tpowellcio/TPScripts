function dlp
  #youtube-dl --embed-thumbnail --convert-thumbnails jpg --ppa "ffmpeg_o:ThumbnailsConvertor:-q:v 1" --ignore-errors -o '~/Movies/youtube/%(playlist)s/%(title)s.%(ext)s' "$argv"
  yt-dlp $argv \
  --embed-thumbnail \
  --convert-thumbnails jpg \
  --ppa "ffmpeg_o:ThumbnailsConvertor:-q:v 1" \
  --ignore-errors \
  -o "~/Movies/youtube/%(playlist)s/%(title)s.%(ext)s" 
end