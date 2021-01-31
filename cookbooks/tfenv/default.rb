tf = { version: '0.14.5' }

execute "tfenv install #{tf[:version]}" do
  user node[:user]
end

