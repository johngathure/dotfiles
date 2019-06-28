#!/bin/bash

# color formats
RED="`tput setaf 1`"
GREEN="`tput setaf 2`"
BOLD="`tput bold`"
NORM="`tput sgr0`"

# User's home dir
HOMEDIR=$HOME

clear
echo -e "Setting up vim/nvim and tmux config files..... \n"
# Promt user to enter editor they are using.
read -p "${BOLD}Are you using vim or neovim (VI) for vim (NVI) for neovim... ${NORM}" editor

# enable case insensitive matching ie if user enters vi create sys link
shopt -s nocasematch

if [ -z $editor ]
then
    echo "${RED}Please enter editor...${NORM}"
    exit 1
elif [[ $editor == "VI" ]]
then
    echo "${BOLD}Creating system link $(pwd)/vimrc -> $HOMEDIR/.vimrc${NORM}"
    ln -sf $(pwd)/vimrc $HOMEDIR/.vimrc
    echo "${GREEN}Successfully created system link${NORM}"
elif [[ $editor == "NVI" ]]
then 

    echo "${BOLD}Creating system link $(pwd)/vimrc -> ${HOMEDIR}/.config/nvim/init.vim${NORM}"
    [ -d $HOMEDIR/.config/nvim ] || mkdir -p $HOMEDIR/.config/nvim
    ln -sf $(pwd)/vimrc $HOMEDIR/.config/nvim/init.vim
    echo "${GREEN}Successfully created system link${NORM}"
else
    echo -e "${RED}Incorrect input${NORM}\a"
    exit 1
fi
# undo case insensitive match
shopt -u nocasematch

# setup tmux conf.
echo "${BOLD}Creating system link $(pwd)/tmux.conf -> ${HOMEDIR}/.tmux.conf${NORM}"
ln -sf $(pwd)/tmux.conf ${HOMEDIR}/.tmux.conf
echo "${GREEN}Successfully created system link${NORM}"

# setup git config
echo "${BOLD}Creating system link $(pwd)/gitconfig -> ${HOMEDIR}/.gitconfig${NORM}"
ln -sf $(pwd)/gitconfig ${HOMEDIR}/.gitconfig
echo "${GREEN}Successfully created system link${NORM}"
