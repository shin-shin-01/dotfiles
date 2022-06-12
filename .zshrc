### alias ###
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

### General ###
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt auto_cd           # ディレクトリ名が一致するなら、cdする
setopt nonomatch

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
unsetopt correctall # 全コマンドで correct 機能を無効化

### Ctrl + R ####
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

### zplugを使ってzshのプラグイン管理 ###
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-completions"                                   # 補完の強化
zplug "zsh-users/zsh-autosuggestions"                               # 履歴補完の強化
zplug "zsh-users/zsh-syntax-highlighting"                           #
# zplug "b4b4r07/enhancd", use:init.sh                              # cd を強化する
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, as:theme # zshテーマの設定

if ! zplug check --verbose; then
    printf "インストールしますか？[y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

### テーマの設定 ###
# https://github.com/Powerlevel9k/powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
##################

### others ###
setopt no_beep               # ビープ音を消す
setopt rm_star_wait          # rm * を実行する前に確認

