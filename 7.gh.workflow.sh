#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
cd $CMD_PATH

p2 "$1 $(date)"

git pull origin dev
git pull origin test

gh auth status
gh pr create --base test --head dev --title "$1 $(date)" --body "$1 $(date)"
