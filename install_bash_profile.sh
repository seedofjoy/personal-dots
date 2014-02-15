#!/bin/bash 
PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR=${PWD}/backup
NOW=`date +"%Y%m%d_%H-%M-%S"`

if [ -f ~/.bash_profile ]; then
    echo "Moving original bash_profile to ${BACKUP_DIR}"
    mv ~/.bash_profile ${BACKUP_DIR}/bash_profile.backup.${NOW}
fi

cp ${PWD}/bash_profile ~/.bash_profile

if `diff ${PWD}/bash_profile ~/.bash_profile >/dev/null` ; then
  printf '\e[0;32m%s\e[0m\n' "bash_profile has been successfully installed!"
else
  printf '\e[0;31m%s\e[0m\n' "bash_config failed to install, please try to install it manually"
fi
