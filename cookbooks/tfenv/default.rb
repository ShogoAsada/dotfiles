tf = { version: '1.2.9' }

execute "tfenv install #{tf[:version]}" do
  user node[:user]
end

