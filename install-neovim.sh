cd /tmp
git clone git@github.com:neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
make CMAKE_INSTALL_PREFIX=$HOME/.neovim install
