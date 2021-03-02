ruby = {
  version: '3.0.0',
  rbenv_path: '~/.rbenv',
  plugin_path: '~/.rbenv/plugin_path'
}

directory File.expand_path(ruby[:plugin_path]) do
  user node[:user]
end

git File.expand_path("#{ruby[:plugin_path]}/rbenv-each") do
  repository 'https://github.com/rbenv/rbenv-each.git'
  user node[:user]
end

git File.expand_path("#{ruby[:plugin_path]}/rbenv-default-gems") do
  repository 'https://github.com/rbenv/rbenv-default-gems.git'
  user node[:user]
end

link File.expand_path("#{ruby[:rbenv_path]}/default-gems") do
  to File.expand_path('../files/.rbenv/default-gems', __FILE__)
  user node[:user]
  force true
end

execute "brew update && brew upgrade ruby-build" do
  user node[:user]
end

execute "rbenv install #{ruby[:version]}" do
  user node[:user]
  not_if "test -d #{ruby[:rbenv_path]}/versions/#{ruby[:version]}"
end

execute "rbenv global #{ruby[:version]}" do
  user node[:user]
end

