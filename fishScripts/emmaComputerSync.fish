function emmaComputerSync
    rsync \
    -avhP \
    --no-perms \
    --no-owner \
    --no-group \
    --exclude '.DS_Store' \
    -O \
    ~/Movies/Emma/ emmac:/Users/emma/Movies/podcastRecordings/
end