autoload -U compinit
compinit

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

source enhanced/init.sh

eval "$(pyenv init -)"

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
#zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, as:theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

zplug load

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

