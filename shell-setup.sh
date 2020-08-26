#!/usr/bin/env zsh
set -x

#######################
# BIN
#######################

mkdir -p $HOME/bin

# FASD
if [[ ! -f $HOME/bin/fasd ]]; then
    git clone https://github.com/clvv/fasd.git /tmp/fasd
    cd /tmp/fasd
    PREFIX=$HOME make install
    cd -
fi

# FZF
if [[ ! -f $HOME/.fzf/bin/fzf ]]; then
    git clone https://github.com/junegunn/fzf.git $HOME/.fzf
    yes | $HOME/.fzf/install
fi

# DIFF-SO-FANCY
if [[ ! -f $HOME/bin/diff-so-fancy ]]; then
    curl -o $HOME/bin/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
fi


#######################
# TMUX
#######################

if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
    mkdir -p $HOME/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi


#######################
# ZSH
#######################
if [[ ! -d $HOME/.zprezto ]]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

mkdir -p $HOME/.zsh

# Fast syntax highlighting
if [[ ! -d $HOME/.zsh/fast-syntax-highlighting ]]; then
    git clone https://github.com/zdharma/fast-syntax-highlighting.git $HOME/.zsh/fast-syntax-highlighting
fi

#######################
# NEOVIM
#######################
# Install neovim itself
# TODO

NVIM=$HOME/.neovim

mkdir -p $NVIM

# Create Python3 environment
if [[ ! -d $NVIM/py3 ]]; then
    python3 -m venv $NVIM/py3
    PIP=$NVIM/py3/bin/pip
    $PIP install neovim
    $PIP install 'python-language-server[all]'
    $PIP install pylint isort jedi flake8
    $PIP install black yapf
fi

# Create node env
if [[ ! -d $NVIM/node ]]; then
    mkdir -p $NVIM/node
    NODE_SCRIPT=/tmp/install-node.sh
    curl -sL install-node.now.sh/lts -o $NODE_SCRIPT
    chmod +x $NODE_SCRIPT
    PREFIX=$NVIM/node $NODE_SCRIPT -y
    PATH="$NVIM/node/bin:$PATH"
    npm install -g neovim
fi

#######################
# RUST
#######################

if [[ ! -d $HOME/.rustup ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

for crate in bat fd-find ripgrep
do
    $HOME/.cargo/bin/cargo install --force $crate
done
