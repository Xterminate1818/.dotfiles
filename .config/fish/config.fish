#set -x PATH "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:."
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/.npm-global/bin


function fish_greeting

end

function fish_mode_prompt

end


alias lf ranger
alias cls clear
alias nv lvim
alias jpwine "LC_ALL=ja_JP wine"

set -x DRI_PRIME 1
set -x RUST_BACKTRACE 1
set -x EDITOR lvim
set -x VISUAL lvim
set fish_cursor_insert line

set -x XDG_RUNTIME_DIR /tmp/1000
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR
