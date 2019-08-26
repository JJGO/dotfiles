# Install dotfiles in CSAIL machines

# SSH keys
rsync -av $SERVER:/home/jjgo/.ssh .

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

zsh <<EOT
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
EOT


# Dotfiles
rsync -av $SERVER:/home/jjgo/.dotfiles .
cd .dotfiles
sudo apt install stow
./setup_all.sh
stow local


# Install fasd
cd /tmp
git clone git@github.com:clvv/fasd.git
cd fasd
PREFIX=$HOME make install


# Install fzf
cd $HOME
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install rust
curl https://sh.rustup.rs > install-rust.sh
chmod +x install-rust.sh
./install-rust.sh -y

# Install crates
cargo install fd-find
cargo install ripgrep
cargo install bat
