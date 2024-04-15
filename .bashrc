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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# Autocomplete
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use --lts > /dev/null

export JAVA_HOME=~/.jdks/temurin-21.0.1
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:~/bin

source ~/.bash-powerline.sh

function mkc {
	mkdir -p -- "$1" && cd -- "$1" || exit
}

function kll {
    ps aux | grep "$1" | awk '{print $2 }' | head -n -1 | xargs kill -9
}

function gt {
    cd $(dirname "$1")
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/filip/google-cloud-sdk/path.bash.inc' ]; then . '/home/filip/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/filip/google-cloud-sdk/completion.bash.inc' ]; then . '/home/filip/google-cloud-sdk/completion.bash.inc'; fi

export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/legacy_credentials/filip.razek@polyconseil.fr/adc.json"


# Load Angular CLI autocompletion.
source <(ng completion script)

# Load fzf key bindings
source /usr/share/doc/fzf/examples/key-bindings.bash

export GPG_TTY=$(tty)
