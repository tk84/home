# パスの設定
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# rvm
# gem セットを作る http://d.hatena.ne.jp/tbrook/20110303/1298497876
[[ -s "/Volumes/Data/Users/hiro/.rvm/scripts/rvm" ]] && source "/Volumes/Data/Users/hiro/.rvm/scripts/rvm"
#rvm --default ruby-head@20110912

rvm use 1.9.2@first --default
#rvm use macruby@first --default
#rvm use jruby-head@first --default

# デフォルトエディタの設定
#export EDITOR="emacsclient -t"
export EDITOR="/usr/local/bin/emacsclient -t"

# ls コマンドをカラー表示
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

SHELL="/bin/zsh -l"

bindkey -e
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias nginx="/usr/local/sbin/nginx"
#alias start_nginx="/usr/local/sbin/nginx -p /Volumes/Data/Users/hiro/Sites/nginx/ -c /Volumes/Data/Users/hiro/Sites/nginx/conf/nginx.conf"
alias start_nginx="/usr/local/sbin/nginx -p /Volumes/Data/Users/hiro/Dropbox/nginx/ -c /Volumes/Data/Users/hiro/Dropbox/nginx/conf/nginx.conf"
