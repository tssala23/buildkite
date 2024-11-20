#!/usr/bin/env bash

if [ ! -d "${HOME}" ]; then
	mkdir -p "${HOME}"
fi

# mkdir -p ${HOME}/.config/containers
# # Below line is not needed for ocp 4.15+ clusters as fuse-overlayfs will be made available
# (
# 	echo '[storage]'
# 	echo 'driver = "vfs"'
# ) >${HOME}/.config/containers/storage.conf

if ! whoami &>/dev/null; then
	if [ -w /etc/passwd ]; then
		echo "${USER_NAME:-user}:x:$(id -u):0:${USER_NAME:-user} user:${HOME}:/bin/bash" >>/etc/passwd
		echo "${USER_NAME:-user}:x:$(id -u):" >>/etc/group
	fi
fi
USER=$(whoami)
START_ID=$(($(id -u) + 1))
echo "${USER}:${START_ID}:2147483646" >/etc/subuid
echo "${USER}:${START_ID}:2147483646" >/etc/subgid

exec "$@"
