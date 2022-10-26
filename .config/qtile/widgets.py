from libqtile import bar, widget

widget_defaults = dict(
    font="Cascadia Mono",
    fontsize=18,
    padding=3,
)
extension_defaults = widget_defaults.copy()

my_widgets = [
    widget.GroupBox(
        highlight_method='block', borderwith=4, margin=10, fontsize=20, disable_drag=True,
        highlight_color=['000000', '282828'], inactive='AAAAAA', active='FFFFFF', margin_x=20
    ),
    widget.Spacer(length=bar.STRETCH),
    widget.Prompt(),
    widget.Systray(),
    widget.Clock(format="%Y.%m.%d %H:%M:%S"),
    widget.Wallpaper(directory="~/Images/wallpapers/wallpaper-engine/Animation.gif"),

]

