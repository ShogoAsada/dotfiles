# rangerのサブシェル多重起動を防ぐ
function ranger
  if set -q -x RANGER_LEVEL
    exit
  else
    command ranger $argv
  end
end

