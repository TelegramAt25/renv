#/usr/bin/env bash

[ -z "$(git config user.name)" ] && {
    git config --global user.name "fukiame"
    git config --global user.email "fukiame@proton.me"
} || :

cat ~/.fukiame/.gitconfig_append >> ~/.gitconfig

byobu-disable || :

echo '
PS1="\w < "
export PATH=~/.fukiame/bin:$PATH
' >> ~/.bashrc

apt -v && sudo apt install neovim ripgrep git git-lfs imagemagick || :
