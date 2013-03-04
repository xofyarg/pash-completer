# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.bash_completion ]; then
    export BASH_COMPLETION=~/.bash_completion
    export BASH_COMPLETION_DIR=~/.bash_completion.d
    . ~/.bash_completion
fi


[ -f ~/.profile ] && source ~/.profile

export HISTCONTROL=ignoreboth
export IGNOREEOF=1
# User specific aliases and functions
eval `dircolors -b` 2>/dev/null

myprompt() {
    local RC=$? RET
    local cwd=`truncate_long_path $PWD`
    if [ $RC -eq 0 ]; then
	RET=":)"
    else
	RET="\[\e[31m\]:(\[\e[0m\] [$RC]"
    fi
    PS1="[\[\e[1;34m\]$cwd\[\e[0m\]] $RET \$ "
}

export PROMPT_COMMAND=myprompt


PATH=~/tmp/pash-completer/comp:$PATH
_filedir()
{
    local IFS=$'\n'
    COMPREPLY=($(comp x"$COMP_LINE" x"$COMP_POINT"))
}

_filedir_xspec()
{
    _filedir "$@"
}
