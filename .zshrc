#use python3.x 
export PATH="/usr/local/bin:$PATH"
#Rust pakage manager
export PATH="$HOME/.cargo/bin:$PATH"
#neovim path
export XDG_CONFIG_HOME=$HOME/.config
#rvm managr path
export PATH="$PATH:$HOME/.rvm/bin"
#zplug path
export ZPLUG_HOME=/usr/local/opt/zplug
#prevent char bug
export LANG=ja_JP.UTF-8
#yarn path
export PATH="$PATH:`yarn global bin`"


# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~#%# "

# pure setting
autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

prompt pure
#

#show Japanese file name
setopt print_eight_bit

## Directory
# Change directory without cd command
#setopt autocd
#cdpath=(.. ~ ~/src)

# Auto ls after cd
function chpwd() { ls }

# Auto cd after mkdir
function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

# hub command setting for github
#function git(){hub "$@"}


## Theme
# Set colors

autoload -Uz colors colors

# Colors for ls
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'


##Completion
# General setting
autoload -Uz compinit
compinit
# Can select by arrow key after completion
zstyle ':completion:*:default' menu select=2
# Match uppercase letter
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

## History
# Command history basics
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# Append command history when using multiple zsh
setopt appendhistory
# Save command history before quit zsh
setopt inc_append_history
# Share command history with other zsh
setopt share_history
# Don't show duplicated command histories
setopt histignorealldups
# Ignore command history starting with space
setopt hist_ignore_space
# Delete excess space with command history 
setopt hist_reduce_blanks
# Wild card
setopt extended_glob

set number

set nocompatible
## Prompt
# PROMPT='%n%# '
# RPROMPT='%c'
PROMPT="%{${fg[green]}%}%n@%m%{${reset_color}%} %~
%# "

set nrformats=

## zplug
# Road init file
source $ZPLUG_HOME/init.zsh
# zplug plugins
zplug "yonchu/zsh-python-prompt"
zplug "yous/vanilli.sh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "chrissicool/zsh-256color"
zplug "mollifier/anyframe"
zplug "b4b4r07/enhancd", use:init.sh
# zplug 'dracula/zsh', as:theme
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

## Others
# Enable # to comment
setopt interactive_comments
# Disable ctrl+D
setopt ignore_eof
# Enable globbing expression
setopt nonomatch
# Notify job status immediately
setopt notify
# Modify spell miss
setopt correct
# Turn off the beep sound
unsetopt beep

# zsh起動時にtmux起動
#[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux

#alias settings
#neovim 
alias vi="nvim"
alias vz='nvim ~/.zshrc'
alias vn='nvim ~/.config/nvim/init.vim'
alias vd='nvim ~/.config/nvim/dein.toml'
alias vx='nvim ~/.xonshrc'
alias vj='nvim ~/.hyper.js'
alias n='v ~/Desktop/note'
#source 
alias sz='source ~/.zshrc'
alias sn='source ~/.config/nvim/init.vim'
alias sx='source ~/.xonshrc'
#git 
alias ga='git add'
alias ga.='git add .'
alias gm='git commit -m'
alias gp='git push'
alias gpm='git push -u origin master'
alias gs='git status'
alias gb='git branch'
alias gcb='git checkout -b'
alias gc='git checkout'
alias gcm='git checkout master'
alias gf='git fetch'
alias gbd='git branch -D'
alias gcr='git reset --hard HEAD^'
#docker
alias centos='docker run -i -t centos /bin/bash'
#tmux 
alias t='tmux'
alias tk='tmux kill-server'
#command
alias p='python3'
alias py='python3 ~/Desktop/atcoder/ex3.py'
#alias python='python3'
alias pip='pip3'
alias r='rails'
alias l="ls"
alias g='cd ~/Desktop/gym'
alias rv='cd ~/Desktop/ReinforcedVegeta'
alias cdd='cd ~/Desktop'
alias vs="code ~/Library/'Application Support'/Code/User/settings.json"
alias fn='cd "$(find . -type d | grep -v "\/\." | peco)"'
alias e='exit'
alias c='charm'
alias i='idea'
alias mk='mkdir'
#Downloads
alias bit="open ~/Desktop/bitflyer/1.2_bitFLyer_Technical-Quiz.pdf"
alias data="open ~/Desktop/bitflyer/input-for-the-quiz.txt"
alias ma="cd ~/Downloads/machine-learning-ex2"
#Rails
alias rs="rails server"
alias rc="rails console"
alias bi="bundle install"
#clion
alias cl="clion"
#note
#! pkill -9 python3
#! nvidia-smi
alias x='xonsh'
#curl
alias tor="curl wttr.in/Toronto"

export PATH=$HOME/.nodebrew/current/bin:$PATH

#xonsh


eval $(thefuck --alias)
