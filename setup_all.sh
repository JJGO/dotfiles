#!/usr/bin/env bash

# set -e          # Exit on error
# set -o pipefail # Exit on pipe error
# set -x          # Enable verbosity

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \;

PROGRAMS=(alias bash env git python scripts stow tmux vim zsh)
# PROGRAMS=(alias aspell bash env git latex python scripts stow tmux vim zsh mac terminal)
OLD_DOTFILES="dotfile_bk_$(date -u +"%Y%m%d%H%M%S")"
mkdir $OLD_DOTFILES

function backup_if_exists() {
    if [ -f $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi
    if [ -d $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi
}

# Clean common conflicts
backup_if_exists ~/.bash_profile
backup_if_exists ~/.bashrc
backup_if_exists ~/.gitconfig
backup_if_exists ~/.tmux.conf

mkdir -p ~/.vim/undodir

for f in ~/.zprezto/runcoms/z*
do
    mv "$f" $OLD_DOTFILES
done

for program in ${PROGRAMS[@]}; do
  stow -v $program
  echo "Configuring $program"
done

echo "Done!"
