export EDITOR=/usr/local/bin/nvim
export GPG_TTY=$(tty)
export PATH=$PATH:/Users/adam.trimble/.asdf/installs/postgres/9.6.8/bin

#   ------------------------------
#   GET SECRETES FROM MAC KEYCHAIN
#   ------------------------------
get_pw () {
  security find-generic-password -ga "$1" -w
}
export NPM_TOKEN="$(get_pw packagecloud.io)"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi
