#
# Executes commands at login post-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

clear

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# If we are not in a tmux session
if [ -z $TMUX ]; then
    # Display system information
    # Print a random, hopefully interesting, adage.
    if (( $+commands[fortune] )); then
      if [[ -t 0 || -t 1 ]]; then
	 if command -v lolcat > /dev/null; then
         	#fortune -s | lolcat
	 else
            #    fortune -s
         fi
         print
      fi
    fi
    export TERM=xterm-256color
fi

#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [[ ! "$TERM" =~ xterm-kitty ]]; then
#  exec tmux
#fi

