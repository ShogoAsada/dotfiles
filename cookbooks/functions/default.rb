define :tap do
  execute "brew tap #{params[:name]}" do
    user, repository = params[:name].split('/')
    not_if "test -d /opt/homebrew/Library/Taps/#{user}/homebrew-#{repository}"
  end
end

define :brew do
  execute "brew install #{params[:name]}" do
    not_if "test -d /opt/homebrew/Cellar/#{params[:name]}"
  end
end

define :cask do
  execute "brew install --cask #{params[:name]}" do
    not_if "test -d /opt/homebrew/Caskroom/#{params[:name]} -o -x /opt/homebrew/bin/#{params[:name]}"
  end
end

