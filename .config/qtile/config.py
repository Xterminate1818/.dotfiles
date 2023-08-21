from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import base
import igpu

mod = "mod1"
terminal = "kitty"
rofi_command = "rofi -show drun"

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = False
wl_input_rules = None
wmname = "Qtile"

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

class GPU(base.ThreadPoolText):
    defaults = [
            ("update_interval", 1.0, "Update interval for the GPU widget"),
            ]
    def __init__(self, **config):
        super().__init__("", **config)
        self.add_defaults(GPU.defaults)

    def poll(self):
        variables = dict()
        device = igpu.get_device(0)

        variables["name"] = device.name

        variables["mem_total"] = device.memory.total
        variables["mem_used"] = device.memory.used
        variables["mem_unit"] = device.memory.unit

        variables["clock"] = device.clocks.graphics
        variables["clock_max"] = device.clocks.max_graphics
        variables["clock_percent"] = device.clocks.graphics / device.clocks.max_graphics

        variables["gpu_percent"] = device.utilization.gpu
        variables["mem_percent"] = device.utilization.memory
        variables["temp"] = device.utilization.temperature

        return self.format.format(**variables)



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

groups = [Group(i) for i in "123456"]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

layouts = [
    layout.MonadTall(
        border_focus=new_colors["green"],
        border_normal=new_colors["white2"],
        border_width=4 ,
        margin=5,
        margin_on_single=0,
        ratio=0.4,
        border_on_single=False,
    ),
]

widget_defaults = dict(
    font="Cascadia Code PL SemiBold",
    foreground=new_colors["white1"],
    background=new_colors["white5"],
    fontshadow=new_colors["white5"],
    fontsize=28,
    padding=2,
)

extension_defaults = widget_defaults.copy()
rainbow = ["9f86c0", "5e548e", "231942", "", ""]


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    borderwith=4,
                    highlight_method="block",
                    disable_drag=True,
                    use_mouse_wheel=False,
                    inactive=new_colors["white2"],
                    active=new_colors["white1"],
                    this_current_screen_border=new_colors["green"],
                ),

                widget.Systray(icon_size=40, padding=10),
                widget.WindowName(),
                widget.Spacer(length=bar.STRETCH),
                widget.Clock(format="%m/%d"),
                widget.Spacer(length=10),
                widget.Clock(format="%H:%M:%S"),
                widget.Spacer(length=bar.STRETCH),
                widget.TextBox(text=" GPU ", background=rainbow[0], padding=0),
                GPU(format="{clock_percent:.0f}% {temp:.0f}°C ", background=rainbow[0], padding=0),
                widget.TextBox(text=" CPU ", background=rainbow[1], padding=0),
                widget.CPU(format="{load_percent:.0f}% ", background=rainbow[1], padding=0),
                widget.ThermalSensor(format="{temp:.0f}{unit} ", background=rainbow[1]),
                widget.TextBox(text=" MEM ", background=rainbow[2]),
                widget.Memory(measure_mem='G', format="{MemPercent:.0f}%", background=rainbow[2]),
            ],
            48,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

floating_layout = layout.Floating(
    border_focus=new_colors["green"],
    border_normal=new_colors["white2"],

    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        # Godot
        Match(title="Please Confirm..."),
        Match(title="Create Script"),
        Match(title="Attach Node Script")
    ]
)

