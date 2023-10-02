#!/usr/bin/env bash

. /backup/backup.config

backup () {
  [ -z "$file_id" ] && return 1
  [ -z "$interval" ] && interval=86400
  # read refresh token
  cache_refresh_token=$(cat /backup/refresh_token)
  [ -z "$cache_refresh_token" ] && cache_refresh_token=$refresh_token

  # get token
  token=$(curl -X POST "https://login.microsoftonline.com/$tenant_id/oauth2/v2.0/token" \
  --header "Content-Type: application/x-www-form-urlencoded" \
  --data-urlencode "client_id=$client_id" \
  --data-urlencode "scope=offline_access Files.ReadWrite" \
  --data-urlencode "refresh_token=$cache_refresh_token" \
  --data-urlencode "grant_type=refresh_token" \
  --data-urlencode "client_secret=$client_secret")

  # save token
  access_token=$(jq -r  '.access_token' <<< "${token}")
  jq -r '.refresh_token' <<< "${token}" > /backup/refresh_token

  # backup files
  backup_file="/tmp/vw_$RANDOM.7z"
  7z a -p$password -mhe=on $backup_file /data/*

  # upload file
  curl -X PUT "https://graph.microsoft.com/v1.0/me/drive/items/$file_id/content" \
  -T $backup_file \
  -H "Authorization: Bearer $access_token"

  # delete backup file
  rm -rf $backup_file
}

while true; do backup; sleep $interval; done
