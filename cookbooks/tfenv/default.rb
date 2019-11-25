node.reverse_merge!(
  tf: {
    version: '0.12.16'
  }
)

execute "tfenv install #{node[:tf][:version]}" do
  user node[:user]
end

