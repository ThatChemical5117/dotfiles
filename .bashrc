#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# for SSH
eval $(keychain --eval --quiet --nogui id_local id_mcserver )

# alias
alias ls='ls --color=auto'
alias suspend='systemctl suspend'
alias poweroff='shutdown now'
PS1="\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]: \[\e[0m\]\[\e[1;32m\]\w \n[\[\e[0;92m\]~\[\e[0;92m\]> \[\e[0m\]"
#PS1='\[\e[0;1;3m\]\w \[\e[0;92m\]~\[\e[0;92m\]> \[\e[0m\]'

# ENV variable
. "/home/michaelkik/.local/share/cargo/env"
