function dlv
  #youtube-dl --embed-thumbnail --ignore-errors -o '~/Movies/youtube/%(title)s.%(ext)s' "$argv"
  #youtube-dl --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4 -o '~/Movies/youtube/%(title)s.%(ext)s' "$argv"
  #youtube-dl -f bestvideo+bestaudio --embed-thumbnail --convert-thumbnails jpg --ppa "ffmpeg_o:ThumbnailsConvertor:-q:v 1" --merge-output-format mp4 -o '~/Movies/youtube/%(title)s.%(ext)s' "$argv"
  yt-dlp $argv\
  -f bestvideo+bestaudio \
  --embed-thumbnail \
  --convert-thumbnails jpg \
  --ppa "ffmpeg_o:ThumbnailsConvertor:-q:v 1" \
  --merge-output-format mp4 
  -o "~/Movies/youtube/%(title)s.%(ext)s" 
end