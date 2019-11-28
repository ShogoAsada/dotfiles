python = { packages: { neovim: 'pynvim' } }

execute "pip3 install #{python[:packages][:neovim]}" do
  user node[:user]
end

