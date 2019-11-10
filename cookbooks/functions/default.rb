define :ln do
  name = params[:name]
  link node[:xdg_config_home] do
    to File.expand_path("../../#{name}/files/#{name}", __FILE__)
    user node[:user]
    force true
  end
end

