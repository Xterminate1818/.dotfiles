from libqtile.config import Group
from keys import *


groups = [Group(i) for i in "αβγδε"]



for i in range(len(groups)):
    keys.extend(
        [
            Key([mod], str(i+1), lazy.group[groups[i].name].toscreen()),
            Key([mod, "shift"], str(i+1), lazy.window.togroup(groups[i].name, switch_group=True))
        ]
    )



