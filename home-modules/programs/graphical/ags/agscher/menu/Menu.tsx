import { Astal, App, Gdk, Gtk } from "astal/gtk3"
import { GLib, Variable, bind, timeout } from "astal"
import { exec } from "astal/process"
import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"
import Notifd from "gi://AstalNotifd"
import Mpris from "gi://AstalMpris"
import Bluetooth from "gi://AstalBluetooth"
import Battery from "gi://AstalBattery"

function User() {
  const avatar = GLib.getenv("HOME") + "/nix/home-modules/programs/graphical/ags/agscher/assets/avatar.png"
  const username = exec(["whoami"])

  const battery = Battery.get_default()

  return <box className="userbox">
    <box className="avatar" css={`background-image: url("${avatar}")`} />
    <box vertical>
      <box className="userinfo">
        <label hexpand halign={Gtk.Align.START} className="username" label={username} />
        <icon className="batteryicon" icon={bind(battery, "icon-name")} />
        <label className="batterypercentage" label={bind(battery, "percentage").as(bat => (bat * 100).toString())} />
      </box>
      <box className="power">
        <button
          onClicked={() => exec("poweroff")}>
          <icon icon="power-poweroff-symbolic" />
        </button>
        <button
          onClicked={() => exec("reboot")}>
          <icon icon="power-reboot-symbolic" />
        </button>
        <button
          onClicked={() => exec("sleep")}>
          <icon icon="power-sleep-symbolic" />
        </button>
        <button
          onClicked={() => exec("logout")}>
          <icon icon="power-logout-symbolic" />
        </button>
      </box>
    </box>
  </box>
}

function Player({ player }) {
  function lengthStr(length: number) {
    const min = Math.floor(length / 60)
    const sec = Math.floor(length % 60)
    const sec0 = sec < 10 ? "0" : ""
    return `${min}:${sec0}${sec}`
  }
  const { START, END } = Gtk.Align

  const title = bind(player, "title").as(title =>
    title || "Unknown Track")

  const artist = bind(player, "artist").as(artist =>
    artist || "Unknown Artist")

  const coverArt = bind(player, "coverArt").as(cover =>
    `background-image: url('${cover}')`)

  const position = bind(player, "position").as(pos => player.length > 0
    ? pos / player.length : 0)

  const playIcon = bind(player, "playbackStatus").as(status =>
    status === Mpris.PlaybackStatus.PLAYING
      ? "media-playback-pause-symbolic"
      : "media-playback-start-symbolic"
  )

  return <box className="musicbox">
    <box className="cover" css={coverArt} />
    <box vertical className="data">
      <label className="title" truncate hexpand halign={START} label={title} />
      <label className="artist" halign={START} valign={START} vexpand wrap label={artist} />
      <slider
        className="position"
        onDragged={({ value }) => player.position = value * player.length}
        value={position}
      />
      <centerbox className="actions">
        <label
          hexpand
          className="current"
          halign={START}
          label={bind(player, "position").as(lengthStr)}
        />
        <box>
          <button
            onClicked={() => player.previous()}>
            <icon icon="media-skip-backward-symbolic" />
          </button>
          <button
            onClicked={() => player.play_pause()}>
            <icon icon={playIcon} />
          </button>
          <button
            onClicked={() => player.next()}>
            <icon icon="media-skip-forward-symbolic" />
          </button>
        </box>
        <label
          className="length"
          hexpand
          halign={END}
          label={bind(player, "length").as(l => l > 0 ? lengthStr(l) : "0:00")}
        />
      </centerbox>
    </box>
  </box>
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

function BT() {
  const bluetooth = Bluetooth.get_default()
  const enabled = Variable<boolean>(bluetooth.get_is_powered())

  function toggleBT() {
    enabled.set(!enabled.get())
    bluetooth.toggle()
  }

  return <button
    onClicked={toggleBT}
    className={bind(enabled).as((enabled) => enabled ? "active" : "")}
  >
    <box className="qsbox">
      <icon
        className="qsicon"
        icon={bind(enabled).as((enabled) => enabled ? "bluetooth-symbolic" : "bluetooth-disabled-symbolic")}
      />
      <box className="qstextbox" vertical>
        <label className="qslabel" label="Bluetooth" halign={Gtk.Align.START} />
        <label className="qstext" label={bind(enabled).as((enabled) => enabled ? "On" : "Off")} halign={Gtk.Align.START} />
      </box>
    </box>
  </button>
}

export default function Menu(gdkmonitor: Gdk.Monitor) {
  const mpris = Mpris.get_default()
 
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
      <User />
      <box vertical className="quicks">
        <box className="row">
          <Wifi />
          <Dnd />
        </box>
        <box className="row">
          <BT />
        </box>
      </box>
      {bind(mpris, "players").as(arr => arr.map(player => (
        <Player player={player} />
      )))}
      <Volume />
    </box>
  </window>
}
