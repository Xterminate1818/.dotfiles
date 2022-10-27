from libqtile import layout
from util import *
from libqtile.config import Match

layouts = [
    layout.MonadTall(
        border_focus=colors["green"],
        border_normal=colors["light-green"],
        border_width=4, margin=5, margin_on_single=0, ratio=0.6,
        border_on_single=False
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
    border_focus=colors["green"],
    border_normal=colors["light-green"],
    border_width=4, margin=5, margin_on_single=0, ratio=0.6,
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
    ]
)


