## JJGO's Dotfiles

My personal configuration files. They are designed for a ZSH + TMUX + NEOVIM stack. 

- `./shell-setup.sh` – will bootstrap the shell environment including
  - [fasd](https://github.com/clvv/fasd) - Autojump
  - [fzf](https://github.com/junegunn/fzf) - Fuzzy Search
  - [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) - Better git diff
  - [prezto](https://github.com/sorin-ionescu/prezto) - ZSH framework
  - [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) - ZSH syntax highlight
  - [powerlevel10k](https://github.com/romkatv/powerlevel10k) - ZSH prompt
  - [neovim](https://github.com/neovim/neovim)
  - Rust CLI apps - [fd-find](https://github.com/sharkdp/fd), [ripgrep](https://github.com/BurntSushi/ripgrep), [tldr](https://github.com/dbrgn/tealdeer) and more
  
- `./setup_all.sh` - Will link dotfiles using `stow` (or python's `dploy`). 
