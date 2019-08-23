# git aliases (based on TJ Holowaychuk's aliases)

# GIT
alias gi="git init && chmod +x .git/hooks/*"
alias gs="git status"
alias gst="git stash"
alias gstp="git stash pop"
alias ga="git add --all"
alias gc="git commit -m"
alias gca="git add --all && git commit -m"
alias gp="git pull"
alias gps="git push"
alias gb="git branch"

alias gbd="git branch -D"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gcp="git cherry-pick"

alias gd="git diff"
# alias gdc="git dic"
alias gsh="git show"
# alias gf="git app"
# alias gfa="git app -a"
# alias gba="git branch -a"
# alias glg="git lg"
alias gh="git hist"
alias gr='cd "`git rev-parse --show-toplevel`"'
# alias gv="git vommit"

complete -F _git_diff gd
complete -F _git_diff gdc
complete -F _git_pull gp
complete -F _git_branch gb
complete -F _git_branch gbd
complete -F _git_checkout gcob
complete -F _git_checkout gco
complete -F _git_cherry-pick gcp
complete -F _git_log glg
complete -F _git_log gh
