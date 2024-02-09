#set -x PATH "/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:."
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/.npm-global/bin
fish_add_path ~/.config/nvim/bin
fish_add_path ~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/
fish_add_path ~/.config/emacs/bin/


function fish_greeting

end

function fish_mode_prompt

end


alias lf ranger
alias cls clear
alias nv nvim
alias glsl glslangValidator 
alias lg lazygit
alias cdu "cd .."
alias jplc "LC_ALL=ja_JP"
alias jpwine "LC_ALL=ja_JP wine"
alias logout "kill -9 -1"
alias chrome-local "chromium --alow-file-access-from-files"

set -x DRI_PRIME 1
#set -x RUST_BACKTRACE 1
set -x RUSTFLAGS "--cfg=web_sys_unstable_apis"
set -x EDITOR lvim
set -x VISUAL lvim
set -x XDG_CONFIG_HOME ~/.config
set fish_cursor_insert line

