
PECO_VERSION='v0.5.1'

case "${OSTYPE}" in
  darwin*)
    OS_TYPE="darwin"
    ;;
  linux*)
    OS_TYPE="linux"
    ;;
esac

if [ ! -f /usr/local/bin/peco  ]; then
  wget -O - "https://github.com/peco/peco/releases/download/${PECO_VERSION}/peco_${OS_TYPE}_amd64.tar.gz" | tar --directory /tmp -zxvf -
  sudo mv /tmp/peco_${OS_TYPE}_amd64/peco /usr/local/bin
  rm -rf /tmp/peco_${OS_TYPE}_amd64/
fi

function hs() {
  cmd=$(history | sort -r | awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF;}' | awk '!a[$0]++' | sed -e '1,2d' | sed '/^hs/d' | peco --query $1)
  eval ${cmd};
  history -s $cmd
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

shopt -u histappend
PROMPT_COMMAND='share_history'

export PS1="\[\e[36m\][\u:\h \w ] \[\e[33m\]$ \[\e[0m\]"
export GREP_OPTIONS='--color=always'
export EDITOR='/usr/bin/vim'
export HISTSIZE=100000
