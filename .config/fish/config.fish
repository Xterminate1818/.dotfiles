set -x PATH "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:~/.local/bin:."

function fish_greeting

end

function fish_mode_prompt

end

function fish_prompt

    set -l uwu (set_color brwhite)"( owo)"(set_color normal)
    set -l who (set_color red)$USER"@"$hostname(set_color normal)
    set -l path (set_color brred)(prompt_pwd)(set_color normal)
    printf "%s %s %s " $uwu $who $path
end

alias lf ranger
alias cls clear

set -x EDITOR nvim
set -x VISUAL nvim
set fish_cursor_insert line
