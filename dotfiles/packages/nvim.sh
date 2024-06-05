#!/bin/sh

set -xe

# sh ./fonts.sh

NVIM_VERSION=v0.9.5

# Check if I'm connected as root user. If not, exit.
if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root."
	exit 1
fi

# Updating libraries to ensure nodejs >= 14 is being installed.
cd "${HOME}"

# Installing neovim dependencies
apt-get update
apt-get install -y \
	git \
	curl \
	zip \
	libluajit-5.1-dev \
	ripgrep \
	fd-find

# Installing lazy git
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin
rm lazygit.tar.gz lazygit

# .deb is not supported for 0.9.0 version upwards. More info: https://github.com/neovim/neovim/issues/22684
# Another options for installing neovim:
# https://github.com/MordechaiHadad/bob

# Install neovim in the way above only for ARM architectures
if [ "$(uname -m)" = "aarch64" ] || [ "$(uname -m)" = "arm" ]; then
	# Steps defined here: https://dev.to/asyncedd/building-neovim-from-source-1794
	apt-get update
	apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
	git clone https://github.com/neovim/neovim.git
	# Versions higher than v0.8.3 present visualization problems when connected inside neovim
	cd neovim
	git checkout ${NVIM_VERSION}
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	make install
	cd -
	rm -rf neovim
else
	# Installing neovim via appimage. Recommended approach: https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.deb
	# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

	curl -LO https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim.appimage
	chmod u+x nvim.appimage
	./nvim.appimage --appimage-extract
	./squashfs-root/AppRun --version
	rm nvim.appimage

	# Exposing nvim globally
	if [ ! -d /squashfs-root ]; then
		mv squashfs-root /
	fi
	ln -s /squashfs-root/AppRun /usr/bin/nvim
fi
