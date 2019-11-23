define :tap do
  execute "brew tap #{params[:name]}" do
    user, repository = params[:name].split('/')
    not_if "test -d /usr/local/Homebrew/Library/Taps/#{user}/homebrew-#{repository}"
  end
end

define :brew do
  execute "brew install #{params[:name]}" do
    not_if "test -d /usr/local/Cellar/#{params[:name]}"
  end
end

define :cask do
  exec "brew cask install #{params[:name]}" do
    not_if "test -d /usr/local/Caskroom/#{params[:name]} -o -x /usr/local/bin/#{params[:name]}"
  end
end

