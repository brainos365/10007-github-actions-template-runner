#!/usr/bin/env bash

set +x
export CMD_PATH=$(cd `dirname $0`; pwd)
cd $CMD_PATH

# 配置git仓库使用git协议，便于推送
git remote -v
git remote set-url origin git@github.com:${GITHUB_REPOSITORY}.git
git remote -v

export GIT_CLONE_PROTECTION_ACTIVE=false

if [ ! -z $OPENOS365_UP_NAME_01 ];then
	cd ~
	target_name=up_01
	git clone -b ${GITHUB_REF_NAME} --depth 5 git@github.com:${OPENOS365_UP_NAME}.git $target_name
	cd $target_name
	./github.runner.sh
	cd ~
	rm -rf $target_name
fi

if [ ! -z $OPENOS365_UP_NAME_02 ];then
	cd ~
	target_name=up_02
	git clone -b ${GITHUB_REF_NAME} --depth 5 git@github.com:${OPENOS365_UP_NAME}.git $target_name
	cd $target_name
	./github.runner.sh
	cd ~
	rm -rf $target_name
fi

if [ ! -z $OPENOS365_UP_NAME_03 ];then
	cd ~
	target_name=up_03
	git clone -b ${GITHUB_REF_NAME} --depth 5 git@github.com:${OPENOS365_UP_NAME}.git $target_name
	cd $target_name
	./github.runner.sh
	cd ~
	rm -rf $target_name
fi



