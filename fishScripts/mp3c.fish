function mp3c
    # Check for --quiet flag
    set -l quiet 0
    set -l new_argv
    for arg in $argv
        if test "$arg" = "--quiet"
            set quiet 1
        else if string match -qr '^--audio-format=' $arg
            set audio_format (string replace -- '--audio-format=' '' $arg)
        else if test "$arg" = "--audio-format"
            set idx (contains -i -- $arg $argv)
            set audio_format $argv[(math $idx + 1)]
        else
            set new_argv $new_argv $arg
        end
    end

    # Check for ffmpeg
    type -q ffmpeg
    or begin
        echo "ffmpeg not found in PATH. Please install it first." >&2
        return 1
    end

    # Default audio format
    set -l audio_format mp3

    # Parse for --audio-format argument
    set -l new_argv
    for arg in $argv
        if string match -qr '^--audio-format=' $arg
            set audio_format (string replace -- '--audio-format=' '' $arg)
        else if test $arg = '--audio-format'
            # Next arg is the format
            set idx (contains -i -- $arg $argv)
            set audio_format $argv[(math $idx + 1)]
        else
            set new_argv $new_argv $arg
        end
    end

    # Supported extensions (add more if needed)
    set -l exts mp3 m4a webm opus flac wav

    # Run yt-dlp with the selected audio format
    yt-dlp $new_argv \
        --ignore-errors \
        --extract-audio \
        --audio-format $audio_format \
        --audio-quality 0 \
        --parse-metadata " %(title)s: %(album)s" \
        --replace-in-metadata title "[\\/:*?\"<>|]" " " \
        --replace-in-metadata section_title "[\\/:*?\"<>|]" " " \
        --embed-metadata \
        --embed-thumbnail \
        --convert-thumbnails jpg \
        --ppa "ffmpeg_o:ThumbnailsConvertor:-q:v 1" \
        --split-chapters \
        --paths "/Users/tpowell/Music/youtube/" \
        --output "%(title)s/%(chapter_number)03d - %(chapter_title)s.%(ext)s"

    # Find all split audio files in the base directory (not in subfolders)
    for ext in $audio_format $exts
        for f in /Users/tpowell/Music/youtube/*.$ext
            if not test -f "$f"
                continue
            end

            set dir (dirname "$f")
            set base (basename "$f")

            # Extract title (everything before the first ' - ')
            set title (string replace -r '^(.*?) - .*' '$1' "$base")

            # Extract chapter title by removing:
            # - the title prefix
            # - the YouTube ID in square brackets
            # - and the extension
            set chapter_title (string match -r --groups-only '^.*? - (.*?) \[.*\]\.' "$base")
            if test -z "$chapter_title"
                set chapter_title (string match -r --groups-only '^.*? - (.*?)\.' "$base")
            end

            # Remove leading "001 ", "002 ", etc. from chapter title if present
            set chapter_title (string replace -r '^\d{3} ' '' "$chapter_title")

            # Extract chapter number (first 3 digits in filename)
            set chapter (string match -r --groups-only ' - (\d{3}) ' "$base")
            if test -z "$chapter"
                set chapter "000"
            end

            # Create destination folder only if it doesn't exist
            set dest_dir "$dir/$title"
            if not test -d "$dest_dir"
                mkdir -p "$dest_dir"
                or begin
                    echo "Failed to create directory: $dest_dir" >&2
                    continue
                end
            end

            # Construct new destination path
            set dest "$dest_dir/$chapter - $chapter_title.$ext"

            # Move and rename the file if needed
            if test "$f" != "$dest"
                mv "$f" "$dest"
                or begin
                    echo "Failed to move $f to $dest" >&2
                    continue
                end
            end

            # Tag file with chapter title
            if test -z "$chapter_title"
                echo "Skipping file due to empty chapter title: $base" >&2
                continue
            end

            # Check current metadata with ffprobe
            # Read and trim tags, fall back to empty if ffprobe fails
            set existing_title (ffprobe -v error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 "$dest" 2>/dev/null | string trim)
            if test -z "$existing_title"
                set existing_title ""
            end

            set existing_album (ffprobe -v error -show_entries format_tags=album -of default=noprint_wrappers=1:nokey=1 "$dest" 2>/dev/null | string trim)
            if test -z "$existing_album"
                set existing_album ""
            end

            set existing_artist (ffprobe -v error -show_entries format_tags=artist -of default=noprint_wrappers=1:nokey=1 "$dest" 2>/dev/null | string trim)
            if test -z "$existing_artist"
                set existing_artist ""
            end

            if not test -r "$dest"
                echo "Cannot read file: $dest" >> ~/mp3c-errors.log
                continue
            end

            # Only re-tag if something is missing or incorrect
            if test "$existing_title" != "$chapter_title" -o "$existing_album" != "$title" -o "$existing_artist" != "$title"
                set tmpfile "$dest.tmp.mp3"

                ffmpeg -v error -i "$dest" -map 0 -y \
                  -metadata title="$chapter_title" \
                  -metadata album="$title" \
                  -metadata artist="$title" \
                  -c copy "$tmpfile" && mv "$tmpfile" "$dest"

                echo "Tagged: $chapter - $chapter_title.$ext"
            else
                echo "Skipped (already tagged): $chapter - $chapter_title.$ext"
            end

            # Tag file with chapter metadata and preserve thumbnail
            set tmpfile "$dest.tmp.mp3"

            ffmpeg -v error -i "$dest" -map 0 -y \
              -metadata title="$chapter_title" \
              -metadata album="$title" \
              -metadata artist="$title" \
              -c copy "$tmpfile" && mv "$tmpfile" "$dest"

            echo "Renamed: $base → $chapter - $chapter_title.$ext"
        end
    end
end