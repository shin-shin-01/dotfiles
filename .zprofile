export PATH="$HOME/.anyenv/bin:$PATH"
export PATH=$PATH:$HOME/.anyenv/.nodenv/shims/npm

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$HOME/usr/local/mysql/bin/mysql
export PATH=$PATH:$HOME/usr/local/bin
export PATH=$PATH:$HOME/Desktop/zumo/gcc-arm-none-eabi-8-2018-q4-major/bin
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH=$PATH:$HOME/usr/local/texlive/2019/texmf-dist/doc
export PATH=LOCAL_PATH:$PATH
export PATH=$PATH:$HOME/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:$HOME/flutter/bin
export PATH=$PATH:$HOME/flutter/.pub-cache/bin
export PATH=$PATH:$HOME/.pub-cache/bin

export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
eval "$(anyenv init -)"

if [ -f ~/.zshrc ] ; then
  . ~/.zshrc
fi
