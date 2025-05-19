import { App } from "astal/gtk3";
import { Variable, GLib, bind } from "astal";
import { Astal, Gtk, Gdk } from "astal/gtk3";
import { subprocess, exec, execAsync } from "astal/process";
import { interval, timeout, idle } from "astal/time";

export default function ScreenShoter(monitor: gdk.monitor) {
  function TakeScreenShot(mode: string) {
    App.toggle_window("ScreenShoter");
    if (mode === "full") {
      execAsync([
        "bash",
        "-c",
        "hyprshot -m active -m output -o ~/Pictures/Screenshots",
      ]);
    } else if (mode === "region") {
      execAsync(["bash", "-c", "hyprshot -m region -o ~/Pictures/Screenshots"]);
    } else if (mode === "window") {
      execAsync(["bash", "-c", "hyprshot -m window -o ~/Pictures/Screenshots"]);
    }
  }

  return (
    <window
      className="ScreenShoter"
      name="ScreenShoter"
      gdkmonitor={monitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      keymode={Astal.Keymode.NONE}
      layer={Astal.Layer.TOP}
      setup={(self) => App.add_window(self)}
      anchor={Astal.WindowAnchor.NONE}
      visible={false}
    >
      <box vertical className="main">
        <label className="header" label="Take screenshot" />
        <box>
          <button className="full" onClicked={() => TakeScreenShot("full")}>
            <box halign={Gtk.Align.CENTER}>
              <icon icon="screenshot-full-symbolic" />
              <label label="Full" />
            </box>
          </button>
          <button className="region" onClicked={() => TakeScreenShot("region")}>
            <box halign={Gtk.Align.CENTER}>
              <icon icon="screenshot-region-symbolic" />
              <label label="Region" />
            </box>
          </button>
          <button className="window" onClicked={() => TakeScreenShot("window")}>
            <box halign={Gtk.Align.CENTER}>
              <icon icon="screenshot-window-symbolic" />
              <label label="Window" />
            </box>
          </button>
        </box>
      </box>
    </window>
  );
}
