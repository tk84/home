# パスの設定
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# rvm
# gem セットを作る http://d.hatena.ne.jp/tbrook/20110303/1298497876
[[ -s "/Users/hiro/.rvm/scripts/rvm" ]] && source "/Users/hiro/.rvm/scripts/rvm"
#rvm --default ruby-head@20110912
#rvm use ruby-head
#rvm default ruby-head@20110912
rvm default macruby@20110928

# デフォルトエディタの設定
#export EDITOR="emacsclient -t"
export EDITOR="/usr/local/bin/emacsclient -t"

# ls コマンドをカラー表示
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

SHELL="/bin/zsh -l"