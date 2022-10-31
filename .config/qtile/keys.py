from libqtile.config import Key
from libqtile.lazy import lazy
from util import *

mod = "mod1"
terminal = "kitty"
rofi_command = "rofi -show run"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "j", lazy.layout.previous(), desc="Previous focus"),
    Key([mod], "k", lazy.layout.next(), desc="Next focus"),
    # Change ratios 
    Key([mod, "shift"], "h", lazy.layout.increase_ratio()),
    Key([mod, "shift"], "l", lazy.layout.decrease_ratio()),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn(rofi_command), desc="Spawn a command using a prompt widget"),
    Key([mod], "t", lazy.spawn('kitty --class floating')),
    Key([mod, "control"], "f", lazy.spawn("kitty --session /home/logan/.config/kitty/ranger.session")),
    Key([mod], "f", lazy.spawn("kitty --session /home/logan/.config/kitty/ranger.session --class floating")),
]


