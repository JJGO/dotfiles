export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Python from pyenv
if command -v pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if command -v pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Matlab
export PATH="/Applications/MATLAB_R2017a.app/bin:$PATH"


# CLI colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Configure Editor
export EDITOR='vim'

# ALIASES
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# SECRET ALIASES
if [ -f ~/.secret-aliases ]; then
    source ~/.secret-aliases
fi

# Tmuxinator completions
source ~/.bin/tmuxinator.bash

# Bash Prompt
PS1="\[\e]0;\u@\h: \W\a\]\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[00;36m\]\W\[\033[00m\]\$ "
PS1="\[\033[36m\][\[\033[m\]\[\033[34m\]\u@\h\[\033[m\] \[\033[32m\]\W\[\033[m\]\[\033[36m\]]\[\033[m\] $ "
# Fasd Init
eval "$(fasd --init auto)"

PATH="/Users/josejavier/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/josejavier/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/josejavier/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/josejavier/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/josejavier/perl5"; export PERL_MM_OPT;


# set PATH so it includes user's .local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"