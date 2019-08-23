source ~/.bashrc
source ~/.bash_profile

# ZSH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

#
# Plug-ins
#

plugins=(rails git ruby bower bundler capistrano docker gem npm rvm tmuxinator zeus)

#
# History
#

# export HISTSIZE=100000
# export HISTFILE="$HOME/.history"
# export SAVEHIST=$HISTSIZE
#
# Options
#

setopt autocd               # .. is shortcut for cd .. (etc)
setopt autoparamslash       # tab completing directory appends a slash
setopt autopushd            # cd automatically pushes old dir onto dir stack
# setopt clobber              # allow clobbering with >, no need to use >!
# setopt correct              # command auto-correction
# setopt correctall           # argument auto-correction
setopt noflowcontrol        # disable start (C-s) and stop (C-q) characters
# setopt nonomatch            # unmatched patterns are left unchanged
setopt histignorealldups    # filter duplicates from history
setopt histignorespace      # don't record commands starting with a space
# setopt histverify           # confirm history expansion (!$, !!, !foo)
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
export SSH_KEY_PATH="~/.ssh/id_rsa.pub"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# export GOPATH=$HOME/dev/golang
# export GOBIN=$HOME/dev/golang/bin

export GIT_ACC=vshaveyko

#### PATH ####
#
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/dev/golang/bin # extend golang bins to PATH
export PATH="./bin:$PATH" # Add project ./bin executables as real commands. magicly applies spring to all commands ?
#
#### PATH ####

### ALIASES

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."


# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# File size
alias fs="stat -f \"%z bytes\""

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done

# Syntax colored cat
alias pcat='pygmentize -f terminal256 -O style=native -g'

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"

alias pip2=/usr/local/opt/python@2/libexec/bin/pip
alias pip=pip3
alias python=python3

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
alias rdbm="rails db:migrate"

# GIT
autoload bashcompinit
bashcompinit # required for git-completion.sh, aliases.git.sh

source "$HOME/config/.bash/git-completion.sh"
source "$HOME/config/.bash/aliases.git.sh"
source "$HOME/config/bin/terminal_chrome.sh"
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
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export TERM=xterm-256color

function luigi_rerun() {
  ~/config/luigi_rerun/redo "$@"
}

function luigi_rm() {
  ~/config/luigi_rerun/rm "$@"
}

function luigi_out() {
  ~/config/luigi_rerun/outputs "$@"
}

function cg1() {
  (eval $(docker-machine env cookgraphs-1) && $@)
}

function cg1l() {
  cg1 docker logs cookgraphs_${1:-app}_1 | tail -n ${2:-50}

}

function cg1ps() {
  cg1 docker ps
}

export PATH="/usr/local/opt/ruby/bin:$PATH"
