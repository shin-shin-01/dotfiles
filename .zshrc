autoload -U compinit
compinit

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

source enhanced/init.sh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
#zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, as:theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

zplug load

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kaze/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kaze/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kaze/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kaze/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

