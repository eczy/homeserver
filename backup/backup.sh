#!/bin/sh
set -e

# Redmine
PGPASSWORD=${REDMINE_PASSWORD} /usr/bin/pg_dump -U ${REDMINE_USERNAME} -h redmine_db -Fc --file=/backup/redmine/redmine.sqlc redmine
rsync -a /data/redmine/files /backup/redmine

cd /backup
tar -czvf /backup/archives/redmine_`date +%Y-%m-%d`.tar.gz redmine

# Delete backups older than 7 days
find $(pwd) -mtime +7 -type f -delete