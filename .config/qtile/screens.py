from libqtile import bar
from libqtile.config import Screen
from widgets import *
from util import *

screens = [
    Screen(
        #wallpaper="/home/logan/Images/wallpapers/648824.jpg",
        wallpaper="/home/logan/Pictures/wallpapers/648824.jpg",
        top=bar.Bar(
            my_widgets, 45,
            background=colors["light-green"],
            border_on_single=False
            #border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            #border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        bottom=bar.Gap(5),
        left=bar.Gap(5),
        right=bar.Gap(5)
    ),
]

