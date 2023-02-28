from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import layout

# Initial setup
HAS_BATTERY = False
try:
    import psutil

    HAS_BATTERY = psutil.sensors_battery() is not None
except:
    print("Missing psutil, assuming no battery!")

try:
    import iwlib
except:
    print("Missing iwlib, cannot get signal strength!")

SCALE = 1
try:
    import tkinter as tk

    root = tk.Tk()
    screen_height = root.winfo_screenheight()
    SCALE = int(screen_height / 1080)
    root.destroy()
except:
    print("Missing tkinter, assuming 1080p screen!")
    SCALE = 1


def wifiLevel():
    if iwlib is None:
        return "WIFI=ERR"
    interface_name = "wlan0"
    interface = iwlib.get_iwconfig(interface_name)
    if "stats" not in interface:
        return "WIFI=D/C"
    quality = (interface["stats"]["quality"]) / 70.0 * 100.0
    quality = round(quality)
    return "WIFI=" + str(quality) + "%"


# GENERAL CONFIG
mod = "mod1"
terminal = "kitty"
rofi_command = "rofi -show drun"

# Terminal color scheme

new_colors = {
    "black": "000000",
    "white0": "edecec",
    "white1": "#f7f7f7",
    "white2": "#a4a1a1",
    "white3": "#5b5754",
    "white4": "#494542",
    "white5": "#3a3332",
    "green": "#00a152",
    "red": "#ec583a",
}


dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "Qtile"

# MOUSE CONFIG
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# KEY CONFIG
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
    Key(
        [mod],
        "r",
        lazy.spawn(rofi_command),
        desc="Spawn a command using a prompt widget",
    ),
]

# LAYOUT CONFIG
layouts = [
    layout.MonadTall(
        border_focus=new_colors["green"],
        border_normal=new_colors["white2"],
        border_width=4 * SCALE,
        margin=5 * SCALE,
        margin_on_single=0,
        ratio=0.4,
        border_on_single=False,
    ),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
floating_layout = layout.Floating(
    border_focus=new_colors["green"],
    border_normal=new_colors["white2"],
    border_width=4 * SCALE,
    margin=5 * SCALE,
    margin_on_single=0,
    ratio=0.4,
    border_on_single=False,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(wm_class="floating"),
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
)

# GROUP CONFIG
groups = [Group(i) for i in "αβγδεζ"]

for i in range(len(groups)):
    keys.extend(
        [
            Key([mod], str(i + 1), lazy.group[groups[i].name].toscreen()),
            Key(
                [mod, "shift"],
                str(i + 1),
                lazy.window.togroup(groups[i].name, switch_group=True),
            ),
        ]
    )

# WIDGET CONFIG
widget_defaults = dict(
    font="Cascadia Code PL SemiBold",
    fontsize=18 * SCALE,
    padding=0,
    foreground=new_colors["white1"],
    background=new_colors["white5"],
)
extension_defaults = widget_defaults.copy()

inverted_opts = dict(foreground=new_colors["white5"], background=new_colors["white1"])


# Circle border
def opener(**kwargs):
    return widget.TextBox("", fontsize=34 * SCALE, **kwargs)


def closer(**kwargs):
    return widget.TextBox("", fontsize=30 * SCALE, **kwargs)


# Battery setup
battery_widgets = []
if HAS_BATTERY:
    battery_widgets = [
        widget.TextBox(text="BAT="),
        widget.Battery(format="{percent:2.0%}", update_interval=10),
        widget.Spacer(length=20),
    ]

rainbow = ["ff595e", "ffca3a", "8ac926", "1982c4", "6a4c93"]

# Widget list
my_widgets = [
    widget.Spacer(length=5),
    widget.GroupBox(
        borderwith=4,
        highlight_method="block",
        disable_drag=True,
        use_mouse_wheel=False,
        inactive=new_colors["white2"],
        active=new_colors["white1"],
        this_current_screen_border=new_colors["green"],
    ),
    widget.Spacer(length=bar.STRETCH),
    *battery_widgets,
    closer(foreground=rainbow[3]),
    widget.GenPollText(
        func=wifiLevel,
        update_interval=1,
        background=rainbow[3],
        foreground=new_colors["black"],
    ),
    widget.Spacer(length=20, background=rainbow[3]),
    closer(foreground=rainbow[2], background=rainbow[3]),
    widget.Wttr(
        location={"San Antonio": "SA"},
        format="%t",
        background=rainbow[2],
        foreground=new_colors["black"],
    ),
    widget.Spacer(length=20, background=rainbow[2]),
    closer(foreground=rainbow[1], background=rainbow[2]),
    widget.Clock(format="%m/%d", background=rainbow[1], foreground=new_colors["black"]),
    widget.Spacer(length=20, background=rainbow[1]),
    closer(foreground=rainbow[0], background=rainbow[1]),
    widget.Clock(
        format="%H:%M:%S", background=rainbow[0], foreground=new_colors["black"]
    ),
    widget.Spacer(length=20, background=rainbow[0]),
]

# SCREEN CONFIG
screens = [
    Screen(
        wallpaper="/home/logan/.config/qtile/wallpapers/wp2.png",
        wallpaper_mode="fill",
        # wallpaper="/home/logan/Images/wallpapers/648824.jpg",
        # wallpaper="/home/logan/Pictures/wallpapers/648824.jpg",
        top=bar.Bar(
            my_widgets,
            34 * SCALE,
            background=new_colors["white5"],
            border_on_single=False,
            margin=[0, 0, 10 * SCALE, 0],
            # border_width=[2, -2, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        bottom=bar.Gap(10 * SCALE),
        left=bar.Gap(10 * SCALE),
        right=bar.Gap(10 * SCALE),
    ),
]
