#!/usr/bin/env bash

set -x
export CMD_PATH=$(cd `dirname $0`; pwd)
cd $CMD_PATH

cd /
sudo df -h
date
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y tzdata
sudo ln -sfv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
date

if [ ! -z $OPENOS365_DOWN_NAME_01 ];then
	cd ~
	target_name=down_01
	git clone -b ${GITHUB_REF_NAME} --depth 5 git@github.com:${OPENOS365_UP_NAME_01}.git $target_name
	cd $target_name
	echo "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)" >> ci.txt
	p2 "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)"
	cd ~
	rm -rf $target_name
fi

if [ ! -z $OPENOS365_DOWN_NAME_02 ];then
	cd ~
	target_name=down_02
	git clone -b ${GITHUB_REF_NAME} --depth 5 git@github.com:${OPENOS365_UP_NAME_02}.git $target_name
	cd $target_name
	echo "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)" >> ci.txt
	p2 "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)"
	cd ~
	rm -rf $target_name
fi

if [ ! -z $OPENOS365_DOWN_NAME_03 ];then
	cd ~
	target_name=down_03
	git clone -b ${GITHUB_REF_NAME} --depth 5 git@github.com:${OPENOS365_UP_NAME_03}.git $target_name
	cd $target_name
	echo "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)" >> ci.txt
	p2 "${GITHUB_REPOSITORY}:${GITHUB_REF_NAME}:${GITHUB_RUN_NUMBER}:$(date)"
	cd ~
	rm -rf $target_name
fi
