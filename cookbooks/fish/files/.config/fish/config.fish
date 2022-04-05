set -x EDITOR nvim
set -x XDG_CONFIG_HOME $HOME/.config
set -x GHQ_ROOT $HOME/ghq/src
eval (direnv hook fish)
set -x JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-12.jdk/Contents/Home/
set -U FZF_LEGACY_KEYBINDINGS 0
set -x FZF_DEFAULT_OPTS '--height 60% --reverse --border'
set -x FZF_FIND_FILE_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_FIND_FILE_OPTS '--preview "bat  --color=always --style=header,grid --line-range :100 {}"'

source /usr/local/opt/asdf/libexec/asdf.fish

alias v 'nvim'
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias r 'ranger'
alias g 'git'
alias gb 'git branch'
alias gco 'git checkout'
alias glo 'git log --oneline'
alias glall 'git log --oneline --decorate --graph --branches --tags --remotes'
alias gp 'git grep'
alias fig 'docker compose'
alias gc 'git branch -a | fzf | xargs git checkout'
alias tar 'gtar'
alias be 'bundle exec'
alias bes 'bundle exec spring'

if test -n 'which colordiff'
  alias diff 'colordiff -u'
end

# sourceなどで環境変数が重複してしまうのでその対策
function remove_duplicate_path
  set -x PATH (echo $PATH | tr ' ' '\n' | sort -u)
end

remove_duplicate_path

# $PATH の優先順位制御のため
set -x PATH /usr/local/bin $PATH
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/.nodenv/shims $PATH
set -x PATH $HOME/.asdf/shims/kubectl $PATH
