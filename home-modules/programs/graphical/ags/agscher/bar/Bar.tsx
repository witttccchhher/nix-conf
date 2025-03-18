import { App } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"

function Workspaces() {
  const hypr = Hyprland.get_default()

  return <box className="workspaces">
    {bind(hypr, "workspaces").as(wss => wss
      .filter(ws => !(ws.id >= -99 && ws.id <= -2))
      .sort((a, b) => a.id - b.id)
      .map(ws => (
        <box
          className={bind(hypr, "focusedWorkspace").as(fw => ws === fw ? "focused" : "")}>
          <label label={ws.id.toString()} />
          <box>
            {bind(ws, "clients").as(clients => clients
              .map(client => (
                <box>
                  <icon icon={bind(client, "class")} />
                  <label visible={bind(hypr, "focusedClient").as(f => f === client)} label={bind(client, "class")} />
                </box>
              ))
            )}
          </box>
        </box>
      ))
    )}
  </box>
}

export default function Bar(monitor: Dgk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return <window
    className="Bar"
    gdkmonitor={monitor}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={TOP | LEFT | RIGHT}>
    <centerbox>
      <box className="start" hexpand halign={Gtk.Align.START}>
        <Workspaces />
      </box>
      <box className="end" hexpand halign={Gtk.Align.END}>
      </box>
    </centerbox>
  </window>
}
