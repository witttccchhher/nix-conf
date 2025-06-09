import { App } from "astal/gtk3";
import { Variable, GLib, bind } from "astal";
import { Astal, Gtk, Gdk } from "astal/gtk3";
import Hyprland from "gi://AstalHyprland";
import Network from "gi://AstalNetwork";
import Bluetooth from "gi://AstalBluetooth";
import Wp from "gi://AstalWp";
import Tray from "gi://AstalTray";

function Workspaces() {
  const hypr = Hyprland.get_default();

  return (
    <box className="workspaces">
      {bind(hypr, "workspaces").as((wss) =>
        wss
          .filter((ws) => !(ws.id >= -99 && ws.id <= -2))
          .sort((a, b) => a.id - b.id)
          .map((ws) => (
            <box
              className={bind(hypr, "focusedWorkspace").as((fw) =>
                ws === fw ? "focused" : "",
              )}
            >
              <box className="clients">
                <label className="workspace" label={ws.id.toString()} />
                {bind(ws, "clients").as((clients) =>
                  clients.map((client) => (
                    <box className="client">
                      <icon icon={bind(client, "class")} />
                      <label
                        className="class"
                        visible={bind(hypr, "focusedClient").as(
                          (f) => f === client,
                        )}
                        label={bind(client, "class").as(
                          (c) =>
                            String(c).charAt(0).toUpperCase() +
                            String(c).slice(1),
                        )}
                      />
                    </box>
                  )),
                )}
              </box>
            </box>
          )),
      )}
    </box>
  );
}

function WiFi() {
  const { wifi } = Network.get_default();

  return <icon className="wifi stateicon" icon={bind(wifi, "iconName")} />;
}

function BlueTooth() {
  const bluetooth = Bluetooth.get_default();
  const enabled = Variable<boolean>(bluetooth.get_is_powered());

  return (
    <icon
      className="bt stateicon"
      icon={bind(enabled).as((enabled) =>
        enabled ? "bluetooth-symbolic" : "bluetooth-disabled-symbolic",
      )}
    />
  );
}

function Volume() {
  const speaker = Wp.get_default().audio.default_speaker;

  return (
    <icon
      className="volume stateicon"
      icon={bind(speaker, "mute").as((muted) =>
        muted ? "audio-volume-muted-symbolic" : "audio-volume-symbolic",
      )}
    />
  );
}

function Separator() {
  return (
    <box vertical className="separator-wrapper">
      <box vexpand />
      <box className="separator" />
      <box vexpand />
    </box>
  );
}

function DateTime() {
  const time = Variable<string>("").poll(
    1000,
    () => GLib.DateTime.new_now_local().format("%B, %A %d, %H:%M")!,
  );

  return (
    <label
      className="datetime"
      onDestroy={() => time.drop()}
      label={time()}
      halign={Gtk.Align.END}
    />
  );
}

function Holiday() {
  const getHolidayBin = GLib.get_current_dir() + "/bar/scripts/bin/getHoliday";
  const holiday = Variable<string>("").poll(3600000, [
    "bash",
    "-c",
    getHolidayBin,
  ]);
  // const holiday = Variable<string>("Spring and Labor Day")

  return (
    <label
      className="holiday"
      onDestroy={() => holiday.drop()}
      label={holiday()}
      maxWidthChars={20}
      halign={Gtk.Align.END}
    />
  );
}

function SysTray() {
  const tray = Tray.get_default();

  return (
    <box className="tray">
      {bind(tray, "items").as((items) =>
        items.map((item) => (
          <menubutton
            usePopover={false}
            direction={Gtk.ArrowType.DOWN}
            actionGroup={bind(item, "actionGroup").as((ag) => ["dbusmenu", ag])}
            menuModel={bind(item, "menuModel")}
          >
            <icon gicon={bind(item, "gicon")} />
          </menubutton>
        )),
      )}
    </box>
  );
}

export default function Bar(monitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

  return (
    <window
      className="Bar"
      gdkmonitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
    >
      <box className="main">
        <box className="start" hexpand halign={Gtk.Align.START}>
	{/*<Workspaces />*/}
        </box>
        <box className="end" hexpand halign={Gtk.Align.END}>
          <SysTray />
          <WiFi />
          <BlueTooth />
          <Volume />
          <Separator />
          <box className="timegroup" vertical vexpand valign={Gtk.Align.CENTER}>
            <DateTime />
            <Holiday />
          </box>
        </box>
      </box>
    </window>
  );
}
