

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
autoload -U colors && colors
# PS1='[%{$fg[yellow]%}%n]-[%{$fg[blue]%}%t]─[${PWD/#$HOME/~}]—[${vcs_info_msg_0_}]—> '

HISTFILE=~/.cashe/zsh/history
alias fetch="archey4"
alias home="cd ~" 
alias ll="ls -al"
alias i3reload="i3-msg reload"
alias i3="vim ~/.config/i3/config"
alias poly="vim ~/.config/polybar/forest/"
alias dot="cd ~/.dotfiles/"
alias ..="cd .."
alias zsc="vim ~/.zshrc"
alias pacman="sudo pacman"
alias fresh="clear;fetch"

fetch

#exit line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
function _update_ps1()
{
    export PROMPT="$(~/.config/powerline-zsh/powerline-zsh.py $?)"
}
precmd()
{
    _update_ps1
}

source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /home/spy/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
