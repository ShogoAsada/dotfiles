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

execute 'curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish' do
  not_if "test -f #{node[:xdg_config_home]}/fish/functions/fisher.fish"
end

link File.expand_path("#{node[:xdg_config_home]}/fish/fishfile") do
  to File.expand_path('../files/.config/fish/fishfile', __FILE__)
  user node[:user]
  force true
end

