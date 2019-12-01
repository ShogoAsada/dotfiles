link File.expand_path("#{node[:home]}/.tigrc") do
  to File.expand_path('../files/.tigrc', __FILE__)
  user node[:user]
  force true
end

