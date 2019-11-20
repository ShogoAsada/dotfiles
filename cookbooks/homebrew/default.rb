execute 'brew update' do
  only_if 'brew doctor'
end

execute '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"' do
  not_if 'brew doctor'
end

tap 'sanemat/font'

brew 'awscli'
brew 'direnv'
brew 'fish'
brew 'git'
brew 'heroku'
brew 'jq'
brew 'neovim'
brew 'postgresql'
brew 'python'
brew 'python@2'
brew 'rbenv'
brew 'ricty'
brew 'tfenv'
brew 'yarn'

cask 'alfred'
cask 'slack'
cask 'docker'

