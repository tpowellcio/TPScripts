function sync_done
    rsync -avhP --no-perms --no-owner --no-group --exclude '.DS_Store' ~/Movies/_Emma/Podcasts/UploadToAnchor/Done/ /Volumes/4TB_Media/Emma_Movies/Podcasts/UploadToAnchor/Done/ || echo "Failed to Sync Done folder"
    rsync -avhP --no-perms --no-owner --no-group --exclude '.DS_Store' ~/Movies/_Emma/Podcasts/GuestFiles/Processed/ /Volumes/4TB_Media/Emma_Movies/Podcasts/GuestFiles/Processed/ || echo "Failed to Sync Processed folder"
    rsync -avhP --no-perms --no-owner --no-group --exclude '.DS_Store' ~/Movies/_Emma/Podcasts/UploadToAnchor/Covers/ /Volumes/4TB_Media/Emma_Movies/Podcasts/UploadToAnchor/Covers/ || echo "Failed to Sync Covers folder"
    while true
        read -l -P 'Do you wish to delete the synced files? [y/N] ' confirm
        switch $confirm
            case Y y
                mv ~/Movies/_Emma/Podcasts/UploadToAnchor/Done/* .Trash/. && echo 'Files from Done folder deleted'
                mv ~/Movies/_Emma/Podcasts/GuestFiles/Processed/* .Trash/.  && echo 'Files from Processed folder deleted'
                mv ~/Movies/_Emma/Podcasts/UploadToAnchor/Covers/* .Trash/. && echo 'Files from Covers folder delted'
                exit 0
            case '' N n
                echo 'No files deleted, please remove manually if desired.'
                exit 0
        end
    end
end