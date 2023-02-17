from libqtile import bar, widget
from datetime import datetime
import psutil
from util import *
from libqtile.config import Key
from libqtile.lazy import lazy

widget_defaults = dict(
    font="BigBlue_Terminal_437TT Nerd Font Mono",
    fontsize=18,
    padding=0,
    foreground_color=colors["bright-white"],
)
extension_defaults = widget_defaults.copy()

backing_color = colors["grey"]

battery_widgets = []

if has_battery():
    battery_widgets = [
        widget.TextBox(text="BAT="),
        widget.Battery(format="{percent:2.0%}", update_interval=10),
        widget.Spacer(length=20),
    ]

my_widgets = [
    widget.Spacer(length=5),
    # opener(),
    widget.GroupBox(
        borderwith=4,
        highlight_method="block",
        disable_drag=True,
        use_mouse_wheel=False,
        inactive=colors["white"],
        active=colors["bright-white"],
        this_current_screen_border=colors["green"],
    ),
    widget.Spacer(length=bar.STRETCH),
    *battery_widgets,
    widget.GenPollText(func=wifiLevel, update_interval=1),
    widget.Spacer(length=20),
    widget.Wttr(location={"San Antonio": "SA"}, format="%t"),
    widget.Spacer(length=20),
    widget.Clock(format="%m/%d"),
    widget.Spacer(length=20),
    widget.Clock(format="%H:%M:%S"),
    widget.Spacer(length=20),
]
