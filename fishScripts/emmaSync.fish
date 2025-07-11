function emmaSync
    rsync \
    -avhP \
    --no-perms \
    --no-owner \
    --no-group \
    --exclude '.DS_Store' \
    ~/Movies/_Emma/ /Volumes/2TB_EXT/Emma_Movies/
end