#!/usr/bin/env bash

echo "从模板更新代码"
set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
echo $PROJECT_NAME
cd $CMD_PATH
git remote add upstream https://github.com/brainos365/10007-github-actions-template-runner.git
git remote set-url upstream https://github.com/brainos365/10007-github-actions-template-runner.git
git pull upstream test
