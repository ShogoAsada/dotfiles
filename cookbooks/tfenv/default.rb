tf = { version: '0.12.16' }

execute "tfenv install #{tf[:version]}" do
  user node[:user]
end

