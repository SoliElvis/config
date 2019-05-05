#!/usr/bin/env python
import gi
from gi.repository import Wnck, Gtk 

gi.require_version('Wnck', '3.0')

screen = Wnck.Screen.get_default()

while Gtk.events_pending():
    Gtk.main_iteration()

windows = screen.get_windows()
active = screen.get_active_window()
for w in windows:
    if not w == active:
        w.minimize()
