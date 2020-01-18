
# Environment setup
if [ -f ~/.env ]; then
    source ~/.env
fi

# Bash Prompt
PS1="\[\e]0;\u@\h: \W\a\]\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[00;36m\]\W\[\033[00m\]\$ "
PS1="\[\033[36m\][\[\033[m\]\[\033[34m\]\u@\h\[\033[m\] \[\033[32m\]\W\[\033[m\]\[\033[36m\]]\[\033[m\] $ "

# ALIASES
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Tmuxinator completions
if [ -f ~/.bin/tmuxinator.bash ]; then
    source ~/.bin/tmuxinator.bash
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
HISTIGNORE="$HISTIGNORE:jrnl *"

source /Users/josejavier/Library/Preferences/org.dystroy.broot/launcher/bash/br
