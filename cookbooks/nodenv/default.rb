nodenv = {
  version: '13.1.0',
  path: "~/.nodenv"
}

execute "nodenv install #{nodenv[:version]}" do
  user node[:user]
  not_if "test -d #{nodenv[:path]}/versions/#{nodenv[:version]}"
end

execute "nodenv global #{nodenv[:version]}" do
  user node[:user]
  not_if "test $(cat #{nodenv[:path]}/version) = #{nodenv[:version]}"
end

