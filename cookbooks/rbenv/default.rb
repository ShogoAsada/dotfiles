node.reverse_merge!(
  ruby: {
    version: '2.6.3',
    rbenv_path: '~/.rbenv',
    plugin_path: '~/.rbenv/plugins'
  }
)

directory File.expand_path(node[:ruby][:plugin_path]) do
  user node[:user]
end

git File.expand_path("#{node[:ruby][:plugin_path]}/rbenv-each") do
  repository 'https://github.com/rbenv/rbenv-each.git'
  user node[:user]
end

git File.expand_path("#{node[:ruby][:plugin_path]}/rbenv-default-gems") do
  repository 'https://github.com/rbenv/rbenv-default-gems.git'
  user node[:user]
end

link File.expand_path("#{node[:ruby][:rbenv_path]}/default-gems") do
  to File.expand_path('../files/.rbenv/default-gems', __FILE__)
  user node[:user]
  force true
end

execute "rbenv install #{node[:ruby][:version]}" do
  user node[:user]
  not_if "test -d #{node[:ruby][:rbenv_path]}/versions/#{node[:ruby][:version]}"
end

execute "rbenv global #{node[:ruby][:version]}" do
  user node[:user]
end

