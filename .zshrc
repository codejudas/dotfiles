# Path to your oh-my-zsh installation.
export ZSH=/Users/efossier/.oh-my-zsh
export TERM="xterm-256color"

# Base Path
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet"

# Python path
export PYTHONPATH="./:${PYTHONPATH}"

#Java home
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home/"

# Hide builtin venv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Twilio
source ~/.zshrc-twilio

# Require 3 Ctrl-D in a row to exit
IGNOREEOF=3
set -o ignoreeof

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="amuse-me"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git jsontools zsh-autosuggestions)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#########
# ALIASES
#########
alias vim="nvim"
alias vi="nvim"
alias sysvim="/usr/bin/vim"
alias python27="python"
alias magic="python"
alias magic3="python3"
alias activate="source ./venv/bin/activate"
alias reactivate="deactivate && activate"
alias rezsh="source ~/.zshrc"
alias jcurl="curl -H 'Content-type: application/json'"
alias watch="watch --color"
alias git="hub"
alias chrome="open -a Google\ Chrome"

alias ls='ls -G -F -L -a -P -h'
alias vimsplit='vim -O'

# GIT ALIASES
alias gs='git status'
alias gf='git fetch'
alias add='git add'
alias commit='git commit'
alias pull='git pull'
alias push='git push'
alias fetch='git fetch'
alias branch='git branch'
alias checkout='git checkout'
alias drop='git checkout -- '
alias dropall='git checkout -- . && git clean -fd'

# create lcd command which does a cd then an ls
function cl {
    builtin cd "$@" && ls -GF
}

#start in specific directory
if [[ $PWD = $HOME ]]; then
    cd ~/Code/twilio
fi

# autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Open vim with ctrl-p by hitting ctrl-p from cmd line
launch_ctrlp() {
        </dev/tty vim -c CtrlP
    }
zle -N launch_ctrlp
bindkey "^p" launch_ctrlp

export PATH="/usr/local/sbin:$PATH"

# Owl
export OWL=/Users/efossier/Code/twilio/owl
eval "$(/Users/efossier/Code/twilio/owl/bin/owl init -)"


## PYENV Stuff
eval $(/usr/libexec/path_helper -s)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
eval "$(pyenv init -)"

## NVM Stuff
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



