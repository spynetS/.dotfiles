# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
 #Use manjaro zsh prompt
 if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
   source /usr/share/zsh/manjaro-zsh-prompt
 fi

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
autoload -U colors && colors
# PS1='[%{$fg[yellow]%}%n]-[%{$fg[blue]%}%t]─[${PWD/#$HOME/~}]—[${vcs_info_msg_0_}]—> '

alias home="cd ~"
alias ll="ls -al"
alias i3reload="i3-msg reload"
alias i3="vim ~/.i3/config"
alias poly="vim ~/.config/polybar/forest/"
alias gitpac="~/.dotfiles/gitpac.sh"
#alias tab="~/.dotfiles/tab.sh &"
alias thor="python ~/dev/Thor/main.py"
neofetch
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


#export PROMPT=$'╭─[[0m[1;33m%n[0m][0m─[0m[[0m[1;34m%d[0m]—[[0m[0;35m%*[0m]—[[0;31m${vcs_info_msg_0_}[0m]\n╰──>'
