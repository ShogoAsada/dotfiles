fish_path = '/opt/homebrew/bin/fish'

directory "#{node[:xdg_config_home]}/fish" do
  user node[:user]
end

execute "echo #{fish_path} | sudo tee -a /etc/shells" do
  not_if "grep #{fish_path} /etc/shells"
end

execute "chsh -s #{fish_path}" do
  not_if { `dscl localhost -read Local/Default/Users/#{node[:user]} UserShell`.include?(fish_path) }
end

link File.expand_path("#{node[:xdg_config_home]}/fish/config.fish") do
  to File.expand_path('../files/.config/fish/config.fish', __FILE__)
  user node[:user]
  force true
end

execute "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish --create-dirs -o #{node[:xdg_config_home]}/fish/functions/fisher.fish" do
  not_if "test -f #{node[:xdg_config_home]}/fish/functions/fisher.fish"
end

link File.expand_path("#{node[:xdg_config_home]}/fish/fish_plugins") do
  to File.expand_path('../files/.config/fish/fish_plugins', __FILE__)
  user node[:user]
  force true
end

execute 'fish -c "fisher update"' do
  user node[:user]
end

