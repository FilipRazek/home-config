echo Hi, $USER!

# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Window size
shopt -s checkwinsize

# Lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

alias ls='ls --color=auto'
alias grep='grep --color=auto'

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

export EDITOR=vim
export NVM_DIR="$HOME/.nvm"

export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
nvm use --lts > /dev/null

export JAVA_HOME=~/.jdks/temurin-21.0.1
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:~/bin

source ~/.bash-powerline.sh

export PATH=$PATH:~/k
export PATH=$PATH:~/custom-scripts

function mkc {
	mkdir -p -- "$1" && cd -- "$1" || exit
}

function kll {
    ps aux | grep "$1" | awk '{print $2 }' | head -n -1 | xargs sudo kill -9
}

function gt {
    cd $(dirname "$1")
}

function timer() {
    local minutes=$1
    local seconds=${2:-0}
    local total_seconds=$((minutes * 60 + seconds))
    
    echo "Timer set for $minutes:$(printf "%02d" $seconds)"
    sleep $total_seconds
    play -q -n synth 0.5 sine 440 remix 1 fade 0 0.5 0.1 \
              synth 0.5 sine 880 remix 1 fade 0 0.5 0.1 \
              synth 0.5 sine 660 remix 1 fade 0 0.5 0.1 2>/dev/null
}


alias "c=xclip -selection clipboard"
alias "v=xclip -o -selection clipboard"

# Load fzf key bindings
source /usr/share/doc/fzf/examples/key-bindings.bash

export GPG_TTY=$(tty)

if [ ! -f '/etc/gitconfig' ]; then sudo ln -s ~/.etc-gitconfig /etc/gitconfig; fi

if [ -f '/home/'$USER'/.bashrc.local' ]; then . '/home/'$USER'/.bashrc.local'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
