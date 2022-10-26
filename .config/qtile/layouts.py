from libqtile import layout

layouts = [
    layout.MonadTall(
        border_focus_stack=["#d75f5f", "#8f3d3d"], 
        border_width=2, margin=5, margin_on_single=0, ratio=0.6
    ),
    layout.MonadTall(
        border_focus_stack=["#d75f5f", "#8f3d3d"], 
        border_width=2, margin=0, margin_on_single=0, ratio=0.6
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

