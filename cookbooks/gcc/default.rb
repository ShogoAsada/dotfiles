link File.expand_path('/usr/local/bin/g++') do
  to File.expand_path('/usr/local/bin/g++-9', __FILE__)
  user node[:user]
  force true
end
