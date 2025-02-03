#!/usr/bin/env bash

[ -f /etc/backup.conf ] && . /etc/backup.conf || return 1

backup () {
  [ -z "$BAK_INTERVAL" ] && BAK_INTERVAL=86400

  # backup files
  backup_file="/tmp/vw_$RANDOM.7z"
  7z a -p$BAK_PASSWORD -mhe=on $backup_file /data/*

  # upload file
  aws s3api put-object --bucket $AWS_BUCKET --key $AWS_FILENAME --body $backup_file --endpoint-url "$AWS_URL"

  # delete backup file
  rm -rf $backup_file
}

while true; do backup; sleep $BAK_INTERVAL; done
