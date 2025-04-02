import { App } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk3"
import { subprocess, exec, execAsync } from "astal/process"
import { interval, timeout, idle } from "astal/time"
import Network from "gi://AstalNetwork"
import Bluetooth from "gi://AstalBluetooth"
import Notifd from "gi://AstalNotifd"

function Toggles() {
  const { wifi } = Network.get_default()
  const wifiEnabled = Variable<boolean>(wifi.get_enabled())
  function toggleWifi() {
    wifiEnabled.set(!wifiEnabled.get())
    wifi.set_enabled(wifiEnabled.get())
  }

  const bluetooth = Bluetooth.get_default()
  const btEnabled = Variable<boolean>(bluetooth.get_is_powered())
  function toggleBT() {
    btEnabled.set(!btEnabled.get())
    bluetooth.toggle()
  }

  const interfaceName = "WARP"
  const vpn = GLib.get_current_dir() + "/menu/scripts/bin"
  const vpnEnabled = Variable<boolean>(exec(["bash", "-c", vpn + "/getVpn " + interfaceName]) === "true")
  function toggleVpn() {
    vpnEnabled.set(!vpnEnabled.get())
    execAsync(["bash", "-c", vpn + "/toggleVpn " + interfaceName])
  }

  return <box vertical className="toggles">
    <box className="wifi">
      <button className={bind(wifiEnabled).as((enabled) => enabled ? "active" : "")}>
        <icon icon={bind(wifi, "iconName")} />
      </button>
      <box vertical className="inner">
        <label label="Wi-Fi" halign={Gtk.Align.START} />
        <label label={bind(wifiEnabled).as((enabled) => enabled ? "On" : "Off")} halign={Gtk.Align.START} />
      </box>
    </box>
    <box className="bluetooth">
      <button className={bind(btEnabled).as((enabled) => enabled ? "active" : "")}>
        <icon icon={bind(btEnabled).as((enabled) => enabled ? "bluetooth-symbolic" : "bluetooth-disabled-symbolic")} />
      </button>
      <box vertical className="inner">
        <label label="Bluetooth" halign={Gtk.Align.START} />
        <label label={bind(btEnabled).as((enabled) => enabled ? "On" : "Off")} halign={Gtk.Align.START} />
      </box>
    </box>
    <box className="vpn">
      <button className={bind(vpnEnabled).as((enabled) => enabled ? "active" : "")}>
        <icon icon={bind(vpnEnabled).as((enabled) => enabled ? "vpn-symbolic" : "vpn-disabled-symbolic")} />
      </button>
      <box vertical className="inner">
        <label label="VPN" halign={Gtk.Align.START} />
        <label label={bind(vpnEnabled).as((enabled) => enabled ? "On" : "Off")} halign={Gtk.Align.START} />
      </box>
    </box>
  </box>
}

function Dnd() {
  const notifd = Notifd.get_default()
  const enabled = Variable<boolean>(notifd.get_dont_disturb())

  function toggleDnd() {
    enabled.set(!enabled.get())
    notifd.set_dont_disturb(enabled.get())
  }

  return <box className="dnd">
    <button className={bind(enabled).as((enabled) => enabled ? "active" : "")}>
      <icon icon={bind(enabled).as((enabled) => enabled ? "dnd-symbolic" : "dnd-disabled-symbolic")} />
    </button>
    <label label="Focus" halign={Gtk.Align.START} />
  </box>
}

export default function Menu(monitor: Gdk.Monitor) {
  const { RIGHT } = Astal.WindowAnchor

  return <window
    className="Menu"
    name="Menu"
    gdkmonitor={monitor}
    exclusivity={Astal.Exclusivity.IGNORE}
    keymode={Astal.Keymode.ON_DEMAND}
    onKeyPressEvent={(self, event: Gdk.Event) => {
        if (event.get_keyval()[1] === Gdk.KEY_Escape) {
            self.hide()
        }
    }}
    layer={Astal.Layer.TOP}
    setup={self => App.add_window(self)}
    anchor={RIGHT}>
    <revealer
      setup={(self) => timeout(500, () => self.revealChild = true)}
      transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
    >
    <box>
      <Toggles />
      <box vertical>
        <Dnd />
      </box>
    </box>
    </revealer>
  </window>
}
