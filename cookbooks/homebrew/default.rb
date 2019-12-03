execute 'brew update' do
  only_if 'brew doctor'
end

execute '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"' do
  not_if 'brew doctor'
end

brew 'awscli'
brew 'circleci'
brew 'colordiff'
brew 'direnv'
brew 'fish'
brew 'fzf'
brew 'ghq'
brew 'git'
brew 'git-secrets'
brew 'heroku'
brew 'jq'
brew 'neovim'
brew 'nkf'
brew 'nodenv'
brew 'postgresql'
brew 'python'
brew 'python@2'
brew 'ranger'
brew 'rbenv'
brew 'tfenv'
brew 'tig'
brew 'yarn'

cask 'alfred'
cask 'docker'
cask 'iterm2'
cask 'slack'

