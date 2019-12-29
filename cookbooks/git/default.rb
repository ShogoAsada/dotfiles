link File.expand_path("#{node[:home]}/.gitconfig") do
  to File.expand_path('../files/.gitconfig', __FILE__)
  user node[:user]
  force true
end

template File.expand_path("#{node[:home]}/.gitconfig.local") do
  source File.expand_path('../templates/.gitconfig.local', __FILE__)
  owner node[:user]
  not_if "test -f #{node[:home]}/.gitconfig.local"
end

link File.expand_path("#{node[:home]}/.git_commit_msg_tpl") do
  to File.expand_path('../files/.git_commit_msg_tpl', __FILE__)
  user node[:user]
  force true
end

link File.expand_path("#{node[:xdg_config_home]}/git") do
  to File.expand_path('../files/config/git', __FILE__)
  user node[:user]
  force true
end

