directory "#{node[:home]}/.grip" do
  user node[:user]
end

link File.expand_path("#{node[:home]}/.grip/settings.py") do
  to File.expand_path('../files/.grip/settings.py', __FILE__)
  user node[:user]
  force true
end
