tf = { version: '1.5.7' }

execute "tfenv install #{tf[:version]}" do
  user node[:user]
end

