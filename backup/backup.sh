#!/bin/sh
set -e

# Gitea
docker exec -u git -it -w /tmp $(docker ps -qf 'name=^gitea$') bash -c '/app/gitea/gitea dump -c /data/gitea/conf/app.ini'
tar -czvf /backup/archives/gitea_`date +%Y-%m-%d`.tar.gz /tmp

# Redmine
PGPASSWORD=${REDMINE_DB_PASSWORD} /usr/bin/pg_dump -U ${REDMINE_DB_USERNAME} -h 'redmine-db' -Fc --file=/backup/redmine/redmine.sqlc redmine
rsync -a /data/redmine/files /backup/redmine
tar -C /backup/redmine -czvf /backup/archives/redmine_`date +%Y-%m-%d`.tar.gz .

# Concourse
PGPASSWORD=${CONCOURSE_DB_PASSWORD} /usr/bin/pg_dump -U ${CONCOURSE_DB_USERNAME} -h 'concourse-db' -Fc --file=/backup/concourse/concourse.sqlc concourse

# Delete backups older than 7 days
find $(pwd) -mtime +7 -type f -delete