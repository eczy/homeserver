FROM docker:latest
RUN apk add postgresql-client rsync
RUN mkdir -p /backup/archives
RUN mkdir -p /backup/gitea
RUN chown -R 1000 /backup
COPY backup.sh /
ADD cronjob /cronjob
RUN /usr/bin/crontab /cronjob

CMD crond -f