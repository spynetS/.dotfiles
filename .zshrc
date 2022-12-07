# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.



# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
autoload -U colors && colors
# PS1='[%{$fg[yellow]%}%n]-[%{$fg[blue]%}%t]─[${PWD/#$HOME/~}]—[${vcs_info_msg_0_}]—> '
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' rehash true  
zmodload zsh/complist
compinit


HISTFILE=~/.cashe/zsh/history
TERM="kitty"

alias tab="$TERM . &"
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
archey4

#exit line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
#
##source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#function _update_ps1()
#{
#    export PROMPT="$(~/.config/powerline-zsh/powerline-zsh.py $?)"
#}
#precmd()
#{
#    _update_ps1
#}
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-vim.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



