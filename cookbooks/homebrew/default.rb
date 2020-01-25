execute 'brew update' do
  only_if 'brew doctor'
end

execute '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"' do
  not_if 'which brew'
end

tap 'heroku/brew'

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
brew 'hub'
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
brew 'tree'
brew 'yarn'

cask 'docker'
cask 'evernote'
cask 'google-chrome'
cask 'google-japanese-ime'
cask 'iterm2'
cask 'kindle'
cask 'slack'
cask 'vagrant'
cask 'virtualbox'
cask 'visual-studio-code'
cask 'dropbox'

