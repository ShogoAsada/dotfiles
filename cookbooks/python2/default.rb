node.revrse_merge!(
  py2: {
    packages: {
      neovim: 'pynvim'
    }
  }
)

execute "pip2 install #{node[:py2][:packages][:neovim]}" do
  user node[:user]
end

