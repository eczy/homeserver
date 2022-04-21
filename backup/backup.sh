#!/bin/sh
set -e

docker exec -u git -it -w /tmp $(docker ps -qf 'name=^gitea$') bash -c '/app/gitea/gitea dump -c /data/gitea/conf/app.ini'
tar -czvf /backup/archives/gitea_`date +%Y-%m-%d`.tar.gz /tmp

# Delete backups older than 7 days
find $(pwd) -mtime +7 -type f -delete