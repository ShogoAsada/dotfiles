directory "#{node[:xdg_config_home]}/yazi" do
  user node[:user]
end

%w[yazi.toml keymap.toml].each do |f|
  link File.expand_path("#{node[:xdg_config_home]}/yazi/#{f}") do
    to File.expand_path("../files/.config/yazi/#{f}", __FILE__)
    user node[:user]
    force true
  end
end

directory "#{node[:xdg_config_home]}/yazi/scripts" do
  user node[:user]
end

link File.expand_path("#{node[:xdg_config_home]}/yazi/scripts/grip-preview.sh") do
  to File.expand_path('../files/.config/yazi/scripts/grip-preview.sh', __FILE__)
  user node[:user]
  force true
end
