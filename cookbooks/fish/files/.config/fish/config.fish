set -x EDITOR nvim
set -x PATH $HOME/.rbenv/shims $PATH
set -x XDG_CONFIG_HOME $HOME/.config
set -x GHQ_ROOT $HOME/ghq/src
eval (direnv hook fish)
set -x PATH $HOME/.nodenv/shims $PATH
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
alias repos 'cd (ghq list -p | peco)'

if test -n 'which colordiff'
  alias diff 'colordiff -u'
end

# sourceなどで環境変数が重複してしまうのでその対策
function remove_duplicate_path
  set -x PATH (echo $PATH | tr ' ' '\n' | sort -u)
end

remove_duplicate_path

