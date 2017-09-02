# ZSH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
#
# Plug-ins
#

plugins=(rails git ruby bower bundler capistrano docker gem npm rvm tmuxinator zeus)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'

#
# History
#

export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
#
# Options
#

setopt autocd               # .. is shortcut for cd .. (etc)
setopt autoparamslash       # tab completing directory appends a slash
setopt autopushd            # cd automatically pushes old dir onto dir stack
setopt clobber              # allow clobbering with >, no need to use >!
setopt correct              # command auto-correction
setopt correctall           # argument auto-correction
setopt noflowcontrol        # disable start (C-s) and stop (C-q) characters
setopt nonomatch            # unmatched patterns are left unchanged
setopt histignorealldups    # filter duplicates from history
setopt histignorespace      # don't record commands starting with a space
setopt histverify           # confirm history expansion (!$, !!, !foo)
setopt ignoreeof            # prevent accidental C-d from exiting shell
setopt interactivecomments  # allow comments, even in interactive shells
# setopt printexitvalue       # for non-zero exit status
setopt pushdignoredups      # don't push multiple copies of same dir onto stack
setopt pushdsilent          # don't print dir stack after pushing/popping
setopt sharehistory         # share history across shells

# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

# ENV
# TODO: export config path and reuse in in script
export TERM=screen-256color
export EDITOR=nvim

export GOPATH=$HOME/dev/golang
export GOBIN=$HOME/dev/golang/bin

export GIT_ACC=vshaveyko

#### PATH ####
#
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/dev/golang/bin # extend golang bins to PATH
export PATH="./bin:$PATH" # Add project ./bin executables as real commands. magicly applies spring to all commands ?
#
#### PATH ####

### ALIASES
#
# VIM
alias nvm="nvim"
alias vm="nvim"
alias nm="nvim"
alias nim="nvim"

function gu() {
  kill -9 $(pgrep node)
  gulp
}

# TMUX
alias t="tmux"
alias tks="tmux kill-server"

alias mux="tmuxinator"

# RAILS
alias r4="rails s webrick -p 4000"
alias r3="rails s webrick -p 3000"
alias rt="rails s webrick -e test"
alias zr="zeus rails s webrick"

alias r4t="rails s webrick -e test -p 4000"
alias zr4="zeus rails s webrick -p 4000"
alias zrt="zeus rails s webrick -e test"

alias zrt4="zeus rails s webrick -e test -p 4000"
alias rdbn="rails db:migrate"

# GIT
autoload bashcompinit
bashcompinit # required for git-completion.sh, aliases.git.sh

source "$HOME/config/.bash/git-completion.sh"
source "$HOME/config/.bash/aliases.git.sh"
source ~/config/dot_files/.completion.zsh

# OTHER
alias ctags="`brew --prefix`/bin/ctags"
function chromekill() {
  echo $(ps aux | awk '/chrom/ { print $2}')

  kill -s QUIT $(ps aux | awk '/chrom/ { print $2}')
}

export LANG=C

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

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
