# パスの設定
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# rvm
# gem セットを作る http://d.hatena.ne.jp/tbrook/20110303/1298497876
[[ -s "/Volumes/Data/Users/hiro/.rvm/scripts/rvm" ]] && source "/Volumes/Data/Users/hiro/.rvm/scripts/rvm"
#rvm --default ruby-head@20110912

rvm use 1.9.3
#rvm use macruby@first --default
#rvm use jruby-head@first --default

# ls コマンドをカラー表示
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

SHELL="/bin/zsh -l"

bindkey -e
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#alias em="emacsclient -t "

export RACK_ENV=development
export RAILS_ENV=development

# デフォルトエディタの設定
export EDITOR="nano"

if [ $STYID ]
then
  alias em="emacsclient -s \"em_$STYID\" "
  alias emt="em -t "
  alias emn="em -n "
  export EDITOR="emt"
fi



