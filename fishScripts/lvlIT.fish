function lvlIT
    set fileName $argv[1]
    set name (string split -r -m1 . $fileName)[1]_dyn
    if test -z "$argv[2]"
        set extension aac
    else
        set extension $argv[2]
    end
    set ext (string split -r -m1 . $fileName)[2]
    set tmpFile (string split -r -m1 . $fileName)[1]_tmp
    set format mp4 avi mov
    # extract Audio from video
    if contains $ext $format
        ffmpeg \
        -i $fileName \
        -vn -acodec copy $tmpFile.aac

        wait 5

        echo "*** $tmpFile.aac Created successfully ***"
    else
        echo "### $ext is not a valid format. Please check the file extension or add the format to the function."
    end
    # Level extracted audio
    if test -f $tmpFile.$extension
        ffmpeg \
        -i $tmpFile.aac \
        -af "dynaudnorm=f=200:g=15" \
        -q:a 0 \
        -map a "$name.$extension"
        
        echo "*** Audio lvled successfully. Filename $name.aac ***"
    else
        echo "### $tmpFile.acc does not exist. Audio extraction from Video must have failed."
    end
    # Recombine audio and video
    if test -f $name.$ext
        echo "### $name.$ext already exists! Remove and retry. ###"
    else
        ffmpeg \
        -i $fileName \
        -i $name.$extension \
        -map 0:v \
        -map 1:a \
        -c:v copy \
        -shortest "$name.$ext" && \
        echo "*** Audio successfully combined. Filename $name.$ext ***"
    end
    # Cleanup
    if test -f $tmpFile.aac
        rm -f $tmpFile.aac && \
        echo "*** $tmpFile.acc Succesffuly removed. ***"
    else
        echo "### Error: $tmpFile.aac File does not exist"
    end
    if test -f $name.$extension
        rm -f $name.$extension && \
        echo "*** $name.$extension Successfully removed. ***"
    else
        echo "### Error: $name.$extension File does not exist"
    end
end