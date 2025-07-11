function mp4c
    yt-dlp $argv \
    -f bestvideo+bestaudio \
    --embed-thumbnail \
    --convert-thumbnails jpg \
    --ppa "ffmpeg_o:ThumbnailsConvertor:-q:v 1" \
    --split-chapters \
    --merge-output-format mp4 \
    --replace-in-metadata title "[\U0000002A\U0000005C\U0000002F\U0000003A\U00000022\U0000003F\U0000007C\U00010000-\U0010FFFF]" " " \
    -o '/Users/tpowell/Movies/youtube/%(title)s/%(section_number)03d - %(section_title)s.%(ext)s'
end