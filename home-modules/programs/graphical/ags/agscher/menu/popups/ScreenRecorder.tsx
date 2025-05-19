import { App } from "astal/gtk3";
import { Variable, GLib, bind } from "astal";
import { Astal, Gtk, Gdk } from "astal/gtk3";
import { subprocess, exec, execAsync } from "astal/process";
import { interval, timeout, idle } from "astal/time";

export default function ScreenRecorder(monitor: gdk.monitor) {
  return (
    <window
      className="ScreenRecorder"
      name="ScreenRecorder"
      gdkmonitor={monitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      keymode={Astal.Keymode.ON_DEMAND}
      layer={Astal.Layer.TOP}
      setup={(self) => App.add_window(self)}
      anchor={Astal.WindowAnchor.NONE}
      visible={false}
    >
      <box className="main" vertical>
        <box className="settings">
          <label label="Framerate" />
          <entry widthChars={6} text="60" />
          <button>
            <label label="Audio" />
          </button>
        </box>
        <button>
          <label label="Record" />
        </button>
      </box>
    </window>
  );
}
