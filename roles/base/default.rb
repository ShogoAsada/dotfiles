node.reverse_merge!(
  user: ENV['SUDO_USER'] || ENV['USER'],
  home: ENV['HOME']
)

include_cookbook 'functions'

