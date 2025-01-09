import { Astal, App, Gdk, Gtk } from "astal/gtk3"
import { Variable, bind } from "astal"
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"
import Notifd from "gi://AstalNotifd"

function User() {
  const avatar = "../assets/avatar.png"
}

function Volume() {
  const speaker = Wp.get_default().audio.default_speaker

  return <box className="volumebox">
    <icon className="volumeicon" icon={bind(speaker, "mute").as((muted) => muted ? "audio-volume-muted-symbolic" : "audio-volume-symbolic")} />
    <slider
      hexpand
      className="volumeslider"
      onDragged={({ value }) => speaker.volume = value}
      value={bind(speaker, "volume")}
    />
  </box>
}

function Wifi() {
  const { wifi } = Network.get_default()
  const enabled = Variable<boolean>(wifi.get_enabled())

  function toggleWifi() {
    enabled.set(!enabled.get())
    wifi.set_enabled(enabled.get())
  }

  return <button
    onClicked={toggleWifi}
    className={bind(enabled).as((enabled) => enabled ? "active" : "")}
  >
    <box className="qsbox">
      <icon
        className="qsicon"
        icon={bind(wifi, "iconName")}
      />
      <box className="qstextbox" vertical>
        <label className="qslabel" label="Internet" halign={Gtk.Align.START} />
        <label className="qstext" label={bind(wifi, "ssid")} halign={Gtk.Align.START} />
      </box>
    </box>
  </button>
}

function Dnd() {
  const notifd = Notifd.get_default()
  const enabled = Variable<boolean>(notifd.get_dont_disturb())

  function toggleDnd() {
    enabled.set(!enabled.get())
    notifd.set_dont_disturb(enabled.get())
  }

  return <button
    onClicked={toggleDnd}
    className={bind(enabled).as((enabled) => enabled ? "active" : "")}
  >
    <box className="qsbox">
      <icon
        className="qsicon"
        icon={bind(enabled).as((enabled) => enabled ? "notification-disabled-symbolic" : "notification-symbolic")}
      />
      <box className="qstextbox" vertical>
        <label className="qslabel" label="Do not disturb" halign={Gtk.Align.START} />
        <label className="qstext" label={bind(enabled).as((enabled) => enabled ? "On" : "Off")} halign={Gtk.Align.START} />
      </box>
    </box>
  </button>
}

export default function NotificationPopups(gdkmonitor: Gdk.Monitor) {
  return <window
    className="Menu"
    name="Menu"
    gdkmonitor={gdkmonitor}
    keymode={Astal.Keymode.ON_DEMAND}
    onKeyPressEvent={(self, event: Gdk.Event) => {
        if (event.get_keyval()[1] === Gdk.KEY_Escape) {
            self.hide()
        }
    }}
    exclusivity={Astal.Exclusivity.EXCLUSIVE}
    anchor={Astal.WindowAnchor.NONE}
    layer={Astal.Layer.TOP}
    visible={false}
    setup={self => App.add_window(self)}
  >
    <box vertical className="main">
      <box vertical className="quicks">
        <box className="row">
          <Wifi />
          <Dnd />
        </box>
      </box>
      <Volume />
    </box>
  </window>
}
