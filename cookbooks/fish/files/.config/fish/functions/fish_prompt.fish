# rangerのサブシェルから起動された場合はpromptを変更する
function fish_prompt
  echo "(RANGER)$_origin_prompt"
end

