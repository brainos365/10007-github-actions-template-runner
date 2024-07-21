#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
echo $PROJECT_NAME
cd $CMD_PATH

if [ ! -z "${GITHUB_REPOSITORY}" ];then
    cd $CMD_PATH
    ./ci/1.ci.run.sh
fi
