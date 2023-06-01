# Load functions
ZSH_FUNCTIONS=${ZDOTDIR}/zsh-functions
[ -f ${ZSH_FUNCTIONS} ] && source ${ZSH_FUNCTIONS}

# Set up the prompt
autoload -Uz promptinit
promptinit
autoload -U colors && colors

# Setup prompt
COLOR_DEF=$'%f'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Use modern completion system
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.

bindkey '^ ' autosuggest-accept
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Load aliases
ZSH_ALIASES=${ZDOTDIR}/zsh-aliases
[ -f ${ZSH_ALIASES} ] && source ${ZSH_ALIASES}

LOCAL_ALIASES=${HOME}/.aliases-local
[ -f ${LOCAL_ALIASES} ] && source ${LOCAL_ALIASES}

# Load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
