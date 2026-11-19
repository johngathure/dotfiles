#!/bin/bash

# color formats
RED="`tput setaf 1`"
GREEN="`tput setaf 2`"
BOLD="`tput bold`"
NORM="`tput sgr0`"

# User's home dir
HOMEDIR=$HOME

# Absolute path of this repo, so the script works from any directory
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

clear
echo -e "Setting up vim/nvim, tmux and git config files..... \n"
# Promt user to enter editor they are using.
read -p "${BOLD}Are you using vim or neovim (VI) for vim (NVIM) for neovim... ${NORM}" editor

# enable case insensitive matching ie if user enters vi create sys link
shopt -s nocasematch

if [ -z $editor ]
then
    echo "${RED}Please enter editor...${NORM}"
    exit 1
elif [[ $editor == "VI" ]]
then
    echo "${BOLD}Creating system link ${DOTFILES}/vim/vimrc -> ${HOMEDIR}/.vimrc${NORM}"
    ln -sf "${DOTFILES}/vim/vimrc" "${HOMEDIR}/.vimrc"
    echo "${GREEN}Successfully created system link${NORM}"
elif [[ $editor == "NVIM" ]]
then 

    NVIM_TARGET="${HOMEDIR}/.config/nvim"
    mkdir -p "${HOMEDIR}/.config"
    # A real (non-symlink) config dir would make ln nest the link inside it,
    # so move it aside first.
    if [ -d "$NVIM_TARGET" ] && [ ! -L "$NVIM_TARGET" ]
    then
        BACKUP="${NVIM_TARGET}.bak.$(date +%Y%m%d%H%M%S)"
        echo "${BOLD}Backing up existing ${NVIM_TARGET} -> ${BACKUP}${NORM}"
        mv "$NVIM_TARGET" "$BACKUP"
    fi
    echo "${BOLD}Creating system link ${DOTFILES}/nvim -> ${NVIM_TARGET}${NORM}"
    # -n replaces an existing symlink instead of following it
    ln -sfn "${DOTFILES}/nvim" "$NVIM_TARGET"
    echo "${GREEN}Successfully created system link${NORM}"
else
    echo -e "${RED}Incorrect input${NORM}\a"
    exit 1
fi
# undo case insensitive match
shopt -u nocasematch

# setup tmux conf.
echo "${BOLD}Creating system link ${DOTFILES}/tmux/tmux.conf -> ${HOMEDIR}/.tmux.conf${NORM}"
ln -sf "${DOTFILES}/tmux/tmux.conf" "${HOMEDIR}/.tmux.conf"
echo "${GREEN}Successfully created system link${NORM}"

# setup git config
echo "${BOLD}Creating system link ${DOTFILES}/git/gitconfig -> ${HOMEDIR}/.gitconfig${NORM}"
ln -sf "${DOTFILES}/git/gitconfig" "${HOMEDIR}/.gitconfig"
echo "${GREEN}Successfully created system link${NORM}"

# setup homebrew Brewfile (used by `brew bundle install --global`)
echo "${BOLD}Creating system link ${DOTFILES}/homebrew/Brewfile -> ${HOMEDIR}/.Brewfile${NORM}"
ln -sf "${DOTFILES}/homebrew/Brewfile" "${HOMEDIR}/.Brewfile"
echo "${GREEN}Successfully created system link${NORM}"

# setup claude code user settings
echo "${BOLD}Creating system link ${DOTFILES}/claude/settings.json -> ${HOMEDIR}/.claude/settings.json${NORM}"
mkdir -p "${HOMEDIR}/.claude"
ln -sf "${DOTFILES}/claude/settings.json" "${HOMEDIR}/.claude/settings.json"
echo "${GREEN}Successfully created system link${NORM}"
