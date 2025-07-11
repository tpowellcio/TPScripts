function lvlAudio
    set fileName $argv[1]
    set name (string split -r -m1 . $fileName)[1]_dyn
    set ext (string split -r -m1 . $fileName)[2]
    ffmpeg \
        -i $fileName \
        -af "dynaudnorm=f=200:g=15" \
        -q:a 0 \
        -map a "$name.$ext"
end