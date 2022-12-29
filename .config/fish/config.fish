set -x PATH "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:~/.local/bin:~/.cargo/bin:."
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin


function fish_greeting

end

function fish_mode_prompt

end


alias lf ranger
alias cls clear
alias nv nvim

set -x EDITOR nvim
set -x VISUAL nvim
set fish_cursor_insert line

set -x XDG_RUNTIME_DIR /tmp/1000
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR
