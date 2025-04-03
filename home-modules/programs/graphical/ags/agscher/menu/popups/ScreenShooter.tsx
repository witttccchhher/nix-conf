import { App } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk3"
import { subprocess, exec, execAsync } from "astal/process"
import { interval, timeout, idle } from "astal/time"

export default function ScreenShooter(monitor: gdk.monitor) {
  return <window
    className="ScreenShooter"
    name="ScreenShooter"
    gdkmonitor={monitor}
    exclusivity={Astal.Exclusivity.IGNORE}
    keymode={Astal.Keymode.ON_DEMAND}
    layer={Astal.Layer.TOP}
    setup={self => App.add_window(self)}
    anchor={Astal.WindowAnchor.NONE}
    visible={false}>
    <box className="main" vertical>
      <box className="settings">
        <label label="Framerate" />
        <entry widthChars={6} text="60" />
        <label label="Audio" />
        <switch />
      </box>
      <button>
        <label label="Record" />
      </button>
    </box>
  </window>
}
