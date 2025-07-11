function lvlCheck
    ffmpeg \ 
        -i $argv[1] \
        -af loudnorm=I=-16:TP=-1.5:LRA=11:print_format=summary \
        -f null -
end