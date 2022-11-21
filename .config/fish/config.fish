set -x PATH "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:~/.local/bin:~/.cargo/bin:."
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin


function fish_greeting

end

function fish_mode_prompt

end

function fish_prompt

    set -l uwu (set_color brwhite)"( owo)"
    set -l who (set_color brgreen)$USER"@"$hostname
    set -l path (set_color brgreen)(prompt_pwd)(set_color normal)
    printf "%s %s %s > " $uwu $who $path
end

alias lf ranger
alias cls clear

set -x EDITOR nvim
set -x VISUAL nvim
set fish_cursor_insert line

set -x XDG_RUNTIME_DIR /tmp/1000
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR
