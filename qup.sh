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

apt -v && {
    sudo apt update
    sudo apt upgrade -y
    sudo apt install neovim ripgrep git git-lfs imagemagick jq zip unzip -y
    sudo apt install libncurses5 libncurses5-dev build-essential -y || :
} || :

repo help || {
    git cl https://github.com/akhilnarang/scripts && {
        cd scripts
        bash setup/android_build_env.sh || :
        cd -
    }
}
