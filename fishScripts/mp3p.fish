function mp3p
    #youtube-dl --ignore-errors --embed-thumbnail --extract-audio --audio-format mp3 --audio-quality 0 -o '~/Music/youtube/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s' "$argv"
    yt-dlp $argv \
        --ignore-errors \
        --embed-thumbnail \
        --extract-audio \
        --audio-format mp3 \
        --audio-quality 0 \
        --parse-metadata " %(playlist_title)s: %(album)s" \
        --embed-metadata \
        -o '~/Music/youtube/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s' 
end