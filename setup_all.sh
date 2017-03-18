#!/usr/bin/env bash

# set -e          # Exit on error
# set -o pipefail # Exit on pipe error
# set -x          # Enable verbosity

# Dont link DS_Store files
find . -name ".DS_Store" -exec rm {} \;

PROGRAMS=(bash git latex mackup python scripts ssh stow tmux tmuxinator unison vim zsh)

# Clean common conflicts
if [ -f ~/.bash_profile ];
then
  mv ~/.bash_profile ~/.bash_profile.bk
fi

for f in ~/.zprezto/runcoms/z*
do
    mv "$f" "$f.bk"
done

for program in ${PROGRAMS[@]}; do
  stow -v $program
  echo "Configuring $program"
done

echo "Done!"