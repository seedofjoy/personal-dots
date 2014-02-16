#!/bin/bash 
PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="${PWD}"/backup
NOW=`date +"%Y%m%d_%H-%M-%S"`

SUBLIME_USER_DIR=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

if [[ -d $SUBLIME_USER_DIR ]]; then
    echo "Making backup of original Packages/User to ${BACKUP_DIR}"
    tar czvf "${BACKUP_DIR}"/sublime.${NOW}.tar.gz "${SUBLIME_USER_DIR}" >/dev/null
fi

cp -R "${PWD}"/sublime_text/Packages/User "${SUBLIME_USER_DIR}"
