python = { packages: { neovim: 'pynvim' } }

execute "pip2 install #{python[:packages][:neovim]}" do
  user node[:user]
end

