if status is-interactive
  eval (/opt/homebrew/bin/brew shellenv)
end

set -x EDITOR nvim
set -x XDG_CONFIG_HOME $HOME/.config
set -x GHQ_ROOT $HOME/ghq/src
eval (direnv hook fish)
set -l java_home (/usr/libexec/java_home 2>/dev/null)
if test -n "$java_home"
  set -x JAVA_HOME $java_home
end
set -x FZF_DEFAULT_OPTS '--height 60% --reverse --border'
set -x FZF_CTRL_T_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_CTRL_T_OPTS '--preview "bat --color=always --style=header,grid --line-range :100 {}"'
set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES

alias v 'nvim'
alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias r 'ranger'
alias y 'yazi'
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
alias tfp 'terraform plan'

if command -q colordiff
  alias diff 'colordiff -u'
end

# $PATH の優先順位制御のため
# fish_add_path は既にある要素を重ねて足さないので、読み込みを繰り返しても増えない
fish_add_path -gPm /usr/local/bin
fish_add_path -gPm $HOME/.rbenv/shims
fish_add_path -gPm $HOME/.nodenv/shims

eval (/opt/homebrew/bin/brew shellenv)
fish_add_path -gPm $HOME/.local/bin

source /opt/homebrew/opt/fzf/shell/key-bindings.fish
fzf_key_bindings

zoxide init fish | source

# Ctrl+g で ghq リポジトリに移動
function __ghq_cd
  set -l query (commandline -b)
  set -l repo (ghq list --full-path | fzf --query "$query")
  commandline -r ""
  if test -n "$repo"
    cd $repo
  end
  commandline -f repaint
end
bind \cg __ghq_cd
