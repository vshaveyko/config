# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
# ENABLE_CORRECTION="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# TODO: export config path and reuse in in script
export TERM=screen-256color
export EDITOR=nvim
export GOPATH=$HOME/dev
export GIT_ACC=vshaveyko

init_health24() {
  guake -n 'zeus' -e 'cd $GOPATH/health24-backend && zeus start' guake -r 'zeus start'
  guake -n 'backend' -e 'cd $GOPATH/health24-backend' guake -r 'backend'
  guake -n 'frontend' -e 'cd $GOPATH/health24-frontend' guake -r 'frontend'
  guake -n 'BACKEND_EDIT' -e 'cd $GOPATH/health24-backend && vim' guake -r 'BACKEND_EDITOR'
}

alias "init=guake -t -e 'init_health24 && exit 0'"

alias nvm="nvim"

alias t="tmux"

function gu() {
  kill -9 $(pgrep node)
  gulp
}

alias r4="rails s webrick -p 4000"
alias r3="rails s webrick -p 3000"
alias rt="rails s webrick -e test"
alias zr="zeus rails s webrick"

alias r4t="rails s webrick -e test -p 4000"
alias zr4="zeus rails s webrick -p 4000"
alias zrt="zeus rails s webrick -e test"

alias zrt4="zeus rails s webrick -e test -p 4000"
alias rdbn="rails db:migrate"
alias ctags="`brew --prefix`/bin/ctags"

alias gi="git init && chmod +x .git/hooks/*"

autoload bashcompinit
bashcompinit

source "$HOME/config/.bash/git-completion.sh"
source "$HOME/config/.bash/aliases.git.sh"
source ~/config/dot_files/.completion.zsh

export LANG=C
export h24=~/dev/health24
