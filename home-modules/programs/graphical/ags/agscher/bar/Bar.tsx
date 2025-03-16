import { App } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"

export default function Bar(monitor: Dgk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  const hyprland = Hyprland.get_default()
  for (const client of hyprland.get_clients()) {
    print(client.title)
  }

  return <window
    className="Bar"
    gdkmonitor={monitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | RIGHT}>
    <centerbox>
      <box hexpand halign={Gtk.Align.START}>
      </box>
    </centerbox>
  </window>
}
