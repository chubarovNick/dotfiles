#!/bin/sh

# Installing ZSH
apt-get update
apt-get install -y zsh

# Configuring ZSH
MY_USER=$(ls /home/ | head -n1)
MY_HOME="/home/${MY_USER}"
if [ ! -d "${MY_HOME}/.oh-my-zsh/" ]; then
	su "${MY_USER}" -c sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"
fi
