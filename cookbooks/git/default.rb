link File.expand_path("#{node[:home]}/.gitconfig") do
  to File.expand_path('../../git/files/.gitconfig', __FILE__)
  user node[:user]
  force true
end

link File.expand_path("#{node[:home]}/.git_commit_msg_tpl") do
  to File.expand_path('../../git/files/.git_commit_msg_tpl', __FILE__)
  user node[:user]
  force true
end

link File.expand_path("#{node[:xdg_config_home]}/git") do
  to File.expand_path('../../git/files/config/git', __FILE__)
  user node[:user]
  force true
end

