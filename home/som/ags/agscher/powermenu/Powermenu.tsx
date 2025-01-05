import { App, Astal, Gdk } from "astal/gtk3"
import { execAsync } from "astal/process"

export default function Powermenu(gdkmonitor: Gdk.Monitor) {
  return <window
  className="Powermenu"
  name="Powermenu"
  gdkmonitor={gdkmonitor}
  exclusivity={Astal.Exclusivity.EXCLUSIVE}
  layer={Astal.Layer.TOP}
  anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT}
  margin-left={10}
  margin-top={10}
  application={App}>
    <box className="main">
      <button onClicked={_ => execAsync("poweroff")} className="poweroff"><icon icon="./assets/poweroff.png" /></button>
      <button onClicked={_ => execAsync("reboot")} className="reboot"><icon icon="./assets/reboot.png" /></button>
      <button onClicked={_ => execAsync("swaymsg exit")} className="logout"><icon icon="./assets/logout.png" /></button>
      <button onClicked={_ => execAsync("gtklock")} className="block"><icon icon="./assets/lock.png" /></button>
    </box>
  </window>
}
