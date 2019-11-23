node.revrse_merge!(
  py3: {
    packages: {
      neovim: 'pynvim'
    }
  }
)

execute "pip3 install #{node[:py3][:packages][:neovim]}" do
  user node[:user]
end

