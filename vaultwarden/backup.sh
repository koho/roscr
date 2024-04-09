#!/usr/bin/env bash

. /backup/backup.config

backup () {
  [ -z "$filename" ] && return 1
  [ -z "$bucket" ] && return 1
  [ -z "$interval" ] && interval=86400

  # backup files
  backup_file="/tmp/vw_$RANDOM.7z"
  7z a -p$password -mhe=on $backup_file /data/*

  # upload file
  aws s3api put-object --bucket $bucket --key $filename --body $backup_file --endpoint-url "$url"

  # delete backup file
  rm -rf $backup_file
}

while true; do backup; sleep $interval; done
