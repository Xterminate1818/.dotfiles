from libqtile import bar, widget
from datetime import datetime
import psutil
from util import *


widget_defaults = dict(
    font="Cascadia Mono",
    fontsize=18,
    padding=0,
    foreground_color=colors["bright-white"]
)
extension_defaults = widget_defaults.copy()

backing_color = colors["grey"]

def opener():
    return widget.TextBox("", font="3270Medium Nerd Font Mono", fontsize=48, foreground=backing_color)

def closer():
    return widget.TextBox("", font="3270Medium Nerd Font Mono", fontsize=48, foreground=backing_color)



my_widgets = [
    widget.Spacer(length=5),
    #opener(),
    widget.GroupBox(
        borderwith=4, highlight_method='block', 
        disable_drag=True,
        #background=backing_color,
        use_mouse_wheel=False,
        #background=backing_color,
        inactive=colors["white"], 
        active=colors["bright-white"], 
        #highlight_color=colors["white"],
        this_current_screen_border=colors["green"],
        #margin_x=0,
    ),
    #closer(),

    widget.Spacer(length=bar.STRETCH),
    opener(),
    #widget.Clock(format=" %Y.%m.%d ", padding=10, background=colors["grey"]),
    # Clock with updating icon
    widget.GenPollText(func=clockEmoji, padding=0, background=backing_color, update_interval=60),
    widget.Clock(format="%H:%M:%S", background=backing_color),
    closer(),
    widget.Spacer(length=bar.STRETCH),
    opener(),
    VolumeText(background=backing_color, fontsize=25),
    widget.TextBox(" ", background=backing_color),
    widget.Volume(background=backing_color),
    closer(),
    widget.Spacer(length=5),
    opener(),
    widget.GenPollText(func=wifiEmoji, background=backing_color, update_interval=15),
    closer(),
    widget.Spacer(length=5),
    opener(),
    widget.GenPollText(func=batteryEmoji, background=backing_color, update_interval=60),
    widget.Battery(background=backing_color, format=" {percent:2.0%}"),
    closer(),
    widget.Spacer(length=5),
]


