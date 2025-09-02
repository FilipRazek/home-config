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
alias python="python3"
alias john="~/.local/john/run/john"


if [ -f ~/.bash_aliases ]; then
source ~/.bash_aliases
fi

export EDITOR=vim
export NVM_DIR="$HOME/.nvm"

export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
nvm use --lts > /dev/null

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:~/bin

source ~/.bash-powerline.sh

function mkc {
mkdir -p -- "$1" && cd -- "$1" || exit
}

function kll {
ps aux | grep "$1" | awk '{print $2 }' | head -n -1 | xargs sudo kill -9
}

function gt {
cd $(dirname "$1")
}


alias "c=xclip -selection clipboard"
alias "v=xclip -o -selection clipboard"

export GPG_TTY=$(tty)

if [ ! -f '/etc/gitconfig' ]; then sudo ln -s ~/.etc-gitconfig /etc/gitconfig; fi

if [ -f '/home/'$USER'/.bashrc.local' ]; then . '/home/'$USER'/.bashrc.local'; fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

. "/home/filip/.deno/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Created by `pipx` on 2024-12-05 08:47:08
export PATH="$PATH:/home/filip/.local/bin"
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/home/filip/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export PATH="$HOME/.local/jtr/run:$PATH"
