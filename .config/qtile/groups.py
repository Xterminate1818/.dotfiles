from libqtile.config import Group
from keys import *
from util import *

groups = [Group(i) for i in "αβγδεζ"]

for i in range(len(groups)):
    keys.extend(
        [
            Key([mod], str(i+1), lazy.group[groups[i].name].toscreen()),
            Key([mod, "shift"], str(i+1), lazy.window.togroup(groups[i].name, switch_group=True))
        ]
    )



