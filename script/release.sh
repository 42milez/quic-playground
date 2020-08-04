#!/bin/bash
# shellcheck disable=SC2086,SC2181

#if [[ -z $GITHUB_TOKEN ]]; then
#  exit 0
#fi
#
#source lib/bash-utils/main.sh "$(pwd)/lib/bash-utils"
#
#WORK_DIR=/var/project
#LOG_DIR=$WORK_DIR/log
#LOG_FILE=$LOG_DIR/script-release.log
#GITHUB_USER=42milez
#GITHUB_REPO=quic
#RELEASE_NAME=quic-$(date +%Y%m%d-%H%M%S)
#ASSET_NAME_LINUX64=quic-linux64
#
#mkdir -p $LOG_DIR
#
#cp -p $BUILD_DIR_PATH/src/quic $WORK_DIR/$ASSET_NAME_LINUX64
#
#: 'CREATE NEW RELEASE' &&
#{
#  console_info_nobr 'Creating new release...'
#
#  github-release release \
#    --user $GITHUB_USER \
#    --repo $GITHUB_REPO \
#    --name $RELEASE_NAME \
#    --tag $RELEASE_NAME \
#  >>$LOG_FILE 2>&1
#
#  if [ $? -ne 0 ]; then
#    console_plain 'ERROR'
#    console_error 'Create new release failed.'
#    exit 1
#  fi
#
#  console_plain 'OK'
#}
#
#: 'UPLOAD ASSET' &&
#{
#  console_info_nobr 'Uploading asset...'
#
#  github-release upload \
#    --user $GITHUB_USER \
#    --repo $GITHUB_REPO \
#    --tag $RELEASE_NAME \
#    --name $ASSET_NAME_LINUX64 \
#    --file $WORK_DIR/$ASSET_NAME_LINUX64 \
#  >>$LOG_FILE 2>&1
#
#  if [ $? -ne 0 ]; then
#    console_plain 'ERROR'
#    console_error 'Upload asset failed.'
#    exit 1
#  fi
#
#  console_plain 'OK'
#}
