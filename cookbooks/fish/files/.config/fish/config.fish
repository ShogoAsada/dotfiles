set -x EDITOR nvim
set -x PATH $HOME/.rbenv/shims $PATH
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x XDG_CONFIG_HOME $HOME/.config
set -x GHQ_ROOT $HOME/ghq/src
eval (direnv hook fish)

set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'
set -U FZF_LEGACY_KEYBINDINGS 0

alias v 'nvim'
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias r 'ranger'
alias gb 'git branch'
alias gc 'git checkout'
alias glo 'git log --oneline'
alias glall 'git log --oneline --decorate --graph --branches --tags --remotes'
alias gp 'git grep'
alias fig 'docker-compose'
alias fbr 'git branch -a | fzf | xargs git checkout'

if test -n 'which colordiff'
  alias diff 'colordiff -u'
end

remove_duplicate_path

