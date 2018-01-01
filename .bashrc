PECO_VERSION='v0.5.2'

case "${OSTYPE}" in
  darwin*)
    OS_TYPE="darwin"
    ARCH_TYPE="zip"
    ;;
  linux*)
    OS_TYPE="linux"
    ARCH_TYPE="tar.gz"
    ;;
esac

if [ ! -f /usr/local/bin/peco  ]; then
  wget -O - "https://github.com/peco/peco/releases/download/${PECO_VERSION}/peco_${OS_TYPE}_amd64.${ARCH_TYPE}" | tar --directory /tmp -zxvf -
  sudo mv /tmp/peco_${OS_TYPE}_amd64/peco /usr/local/bin
  rm -rf /tmp/peco_${OS_TYPE}_amd64/
fi

function hs() {
  cmd=$(history | sort -r | awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF;}' | awk '!a[$0]++' | sed -e '1,2d' | sed '/^hs/d' | peco --query $1)
  eval ${cmd};
  history -s $cmd
}
function hsc() {
  cmd=$(history | sort -r | awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF;}' | awk '!a[$0]++' | sed -e '1,2d' | sed '/^hs/d' | peco --query $1)
  echo -n $cmd | pbcopy
}
function share_history() {
  history -a
  history -c
  history -r
}
function mkcd() {
  mkdir $1;
  cd $1;
}
function ak() {
  eval `ssh-agent`
  ssh-add ~/.ssh/github_id_rsa
}

shopt -u histappend
PROMPT_COMMAND='share_history'

alias ls='ls -G'
alias sl='ls -G'
alias ks='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias lls='ls -G'

alias ivm='vim'
alias vmi='vim'
alias VIM='vim'

alias r='fc -s'
alias gba='git branch -vv'
alias gis='git status'
alias gich='git checkout'
alias gia='git add .'
alias gic='git commit'
alias gip="git push origin \$(git branch --contains | awk '{print \$2}')"
alias ps='ps --sort=start_time'

if [ "$TERM" = xterm ]; then TERM=xterm-256color; fi

export PS1="\[\e[36m\][\u:\h \w ] \[\e[33m\]$ \[\e[0m\]"
export GREP_OPTIONS='--color=always'
export EDITOR='/usr/bin/vim'
export HISTSIZE=100000
