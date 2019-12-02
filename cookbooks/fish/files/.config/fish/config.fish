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

# TODO: remove_duplicate_path関数がなくてもどうにかしたい
# sourceなどで環境変数が重複してしまうのでその対策
# TODO: ~/.config/fish/functionsを掘って、remove_duplicate_path.fishを作る
function remove_duplicate_path
  set -x PATH (echo $PATH | tr ' ' '\n' | sort -u)
end

# rangerのサブシェル多重起動を防ぐ
function ranger
  if set -q -x RANGER_LEVEL
    exit
  else
    command ranger $argv
  end
end

# rangerのサブシェルから起動された場合はpromptを変更する
if set -q -x RANGER_LEVEL
  set -g _origin_prompt (fish_prompt)
  function fish_prompt
    echo "(RANGER)$_origin_prompt"
  end
end

# colordiff alias
if test -n 'which colordiff'
  alias diff 'colordiff -u'
end

remove_duplicate_path
