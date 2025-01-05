import { App, Astal, Gdk } from "astal/gtk3"
import { Variable } from "astal"

export default function Desktop(gdkmonitor: Gdk.Monitor) {
  const hours = Variable("").poll(1000, "date '+%H'")
  const minutes = Variable("").poll(1000, "date '+%M'")
  const seconds = Variable("").poll(1000, "date '+%S'")
  const date = Variable("").poll(5 * 60 * 1000, "date '+%A, %B %d'")

  return <window
  className="Desktop"
  gdkmonitor={gdkmonitor}
  exclusivity={Astal.Exclusivity.EXCLUSIVE}
  layer={Astal.Layer.BOTTOM}
  anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}
  margin-top={20}
  margin-right={20}
  application={App}>
    <box vertical className="main">
      <box className="time">
        <label className="hours" label={hours()}/>
        <label className="minutes" label={minutes()}/>
        <label className="seconds" label={seconds()}/>
      </box>
      <label className="date" label={date()} />
    </box>
  </window>
}
