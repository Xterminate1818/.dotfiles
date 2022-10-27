import datetime
import iwlib
import alsaaudio
import psutil
from libqtile.widget.base import ThreadPoolText

def wifiEmoji():
    interface_name="wlan0"
    interface = iwlib.get_iwconfig(interface_name)
    if "stats" not in interface:
        return "睊 D/C"
    quality = (interface["stats"]["quality"]) / 70.0 * 100
    quality = round(quality)
    return "直 " + str(quality) + "%"

def clockEmoji():
    now = datetime.datetime.now()
    h = now.hour % 13
    if h == 1:
        return " "
    if h == 2:
        return " "
    if h == 3: 
        return " "
    if h == 4:
        return " "
    if h == 5:
        return " "
    if h == 6:
        return " "
    if h == 7:
        return " "
    if h == 8:
        return " "
    if h == 9:
        return " "
    if h == 10:
        return " "
    if h == 11:
        return " "
    if h == 12:
        return " "

def batteryEmoji():
    if hasattr(psutil, "sensors_battery"):
        battery = psutil.sensors_battery() 
        is_plugged = battery.power_plugged
        remaining = round(battery.percent)
        if is_plugged:
            if remaining == 100:
                return " "
            if remaining >= 90:
                return " "
            if remaining >= 80:
                return " "
            if remaining >= 60:
                return " "
            if remaining >= 40:
                return " "
            if remaining >= 30:
                return " "
            else:
                return " "
        else:
            if remaining == 100:
                return ""
            if remaining >= 90:
                return ""
            if remaining >= 80:
                return ""
            if remaining >= 70:
                return ""
            if remaining >= 60:
                return ""
            if remaining >= 50:
                return ""
            if remaining >= 40:
                return ""
            if remaining >= 30:
                return ""
            if remaining >= 20:
                return ""
            if remaining >= 10:
                return ""
            else:
                return "!"


    return

class VolumeText(ThreadPoolText):
    defaults = [
        (
            "update_interval",
            600,
            "Update interval in seconds, if none, the "
            "widget updates whenever it's done'.",
        ),
    ]

    def __init__(self, update_interval: int = 600, **config):
        self.client = alsaaudio.Mixer()
        self.volume = self.client.getvolume()
        self.update_interval = update_interval
        super().__init__(str(self.volume), **config)

    def poll(self):
        self.client = alsaaudio.Mixer()
        self.volume = self.client.getvolume()

        if self.volume[0] == 0:
            return f""
        elif self.volume[0] <= 50:
            return f"墳"
        elif self.volume[0] >= 50:
            return f" "


# Terminal color scheme
colors = {
    "black": "090200",
    "grey": "5b5754",
    "blue": "da2c20",
    "light-blue": "e8bacf",
    "green": "00a152",
    "light-green": "3a3332",
    "aqua": "fcec02",
    "light-aqua": "494542",
    "red": "7f7c7b",
    "light-red": "7f7c7b",
    "purple": "a06994",
    "light-purple": "d6d4d3",
    "yellow": "b5e4f4",
    "light-yellow": "ccab53",
    "white": "a4a1a1",
    "bright-white": "f7f7f7"
}

