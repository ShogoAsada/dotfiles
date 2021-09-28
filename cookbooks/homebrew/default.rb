execute 'brew update' do
  only_if 'brew doctor'
end

execute '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"' do
  not_if 'which brew'
end

tap 'heroku/brew'
tap 'homebrew/cask-drivers'
tap 'AdoptOpenJDK/openjdk'
tap 'hikoyu/shogi'

# MEMO: 将棋AIは /usr/local/opt/ 以下に配置される

brew 'awscli'
brew 'amazon-ecs-cli'
brew 'bat'
brew 'circleci'
brew 'colordiff'
brew 'direnv'
brew 'elmo'
brew 'fish'
brew 'fzf'
brew 'gcc'
brew 'ghq'
brew 'git'
brew 'git-secrets'
brew 'gibo'
brew 'gnu-sed'
brew 'gnu-tar'
brew 'graphviz'
brew 'heroku'
brew 'hub'
brew 'jq'
brew 'maven'
brew 'mruby'
brew 'mruby-cli'
brew 'mtools'
brew 'nasm'
brew 'neovim'
brew 'nkf'
brew 'nodenv'
brew 'openapi-generator'
brew 'postgresql'
brew 'python@3.9'
brew 'python@2'
brew 'ranger'
brew 'rbenv'
brew 'ripgrep'
brew 'sqlformat'
brew 'tfenv'
brew 'tig'
brew 'uonuma-yaneuraou'
brew 'tree'
brew 'yarn'

# cask 'alfred' powerpackが3.xまでなので、4.x以上対応を購入するまでコメントアウト
cask 'adoptopenjdk12'
cask 'docker'
cask 'evernote'
cask 'google-chrome'
cask 'google-japanese-ime'
cask 'iterm2'
cask 'kindle'
cask 'qmk-toolbox'
cask 'quik'
cask 'slack'
cask 'trailer'
cask 'vagrant'
cask 'virtualbox'
cask 'visual-studio-code'
cask 'dropbox'
cask 'zoom'

