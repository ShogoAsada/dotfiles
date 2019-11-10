node.reverse_merge!(
  user: ENV['SUDO_USER'] || ENV['USER'],
  home: ENV['HOME'],
  xdg_config_home: ENV['XDG_CONFIG_HOME'] || "#{ENV['HOME']}/.config"
)

directory node[:xdg_config_home] do
  user node[:user]
end

include_cookbook 'functions'

