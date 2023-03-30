if [ -f /etc/bashrc ]; then
	 . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Add colors to ls
export LS_COLORS='di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
alias ls='ls --color=auto'

# Add colors to grep
alias grep='grep --color=auto'

export VIRTUAL_ENV_DISABLE_PROMPT=1
export PS1='$(if [[ -n "$VIRTUAL_ENV" ]]; then echo "(\[\033[0;33m\]${VIRTUAL_ENV##*/}\[\033[0m\]) "; fi)\[\e[1;31m\]\u \[\e[1;34m\]\w\[\e[0m\]$(git branch &> /dev/null; if [ $? -eq 0 ]; then echo " \[\033[1;37m\][\[\033[1;30m\]$(git branch | grep \* | cut -d " " -f2)\[\033[1;37m\]]\[\033[0m\]"; fi)\n> '

alias grep='grep --color=auto'

#### pyenv config
if [ -f "$HOME/.pyenv/bin/pyenv" ] && ! type -P pyenv &>/dev/null ; then
  export PYTHON_CONFIGURE_OPTS="--enable-shared"
  export CFLAGS="-O2"
  export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init --path --no-rehash)"
fi

export VIRTUAL_ENV_DISABLE_PROMPT=1
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

eval `keychain --eval --agents ssh id_rsa`

source ~/.local/bin/virtualenvwrapper.sh

# To setup Terraform autocomplete
#complete -C /usr/bin/terraform terraform
