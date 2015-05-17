##
# Peco
##
# Peco for repo
function peco-src () {
  local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

zle -N peco-src
bindkey '^]' peco-src

#peco for history
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

#peco for git
function git-hash() {
  git log --oneline --branches --decorate=full | peco | awk '{print $1}'
}
alias -g H='$(git-hash)'

function git-branch() {
  git branch -a | peco | sed -e "s/^\*\s*//g"
}
alias -g B='$(git-branch)'

function git-reflog() {
  git reflog | peco | awk '{print $1}'
}
alias -g R='$(git-reflog)'