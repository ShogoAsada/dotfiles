link node[:xdg_config_home] do
  to File.expand_path('../files/nvim', __FILE__)
  user node[:user]
  force true
end

