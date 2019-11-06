define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(node[:home], params[:name]) do
    to File.expand_path("../../../config/#{source}", __FILE__)
    user node[:user]
  end
end

