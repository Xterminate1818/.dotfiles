set -x PATH "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:~/.local/bin:."

function fish_greeting
  echo -en "\033]0;MS-DOS Prompt\a"
  echo 
  echo
  echo "Microsoft(R) Windows 95"
  echo "   (C)Copyright Microsoft Corp 1981-1996."
  echo
end

function fish_prompt
  printf 'C:%s>' (pwd) | tr "/" "\\\\"
end

function fish_title
  echo MS-DOS Prompt
end
