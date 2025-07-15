{ config, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      dwm = {  
        layer = "top";
        position = "top";
        height = 35;
        spacing = 10;
        reload-style-on-change = true;
        modules-left = [ "niri/workspaces" ];
        modules-center = [
          "image#clock"
          "clock"
        ];
        modules-right = [
          "image#network"
          "network"
          "image#bluetooth"
          "bluetooth"
          "image#volume"
          "wireplumber"
        ];
        "niri/workspaces" = {
          format = "{index}";
          disable-click = true;
        };
        "image#clock" = {
          path = ./assets/clock.svg;
        };
        clock = {
          format = "{:%H:%M %d %b, %a}";
          tooltip = false;
        };
        "image#network" = {
          path = ./assets/network.svg;
        };
        network = {
          format = "{essid}";
          tooltip = false;
        };
        "image#bluetooth" = {
          path = ./assets/bluetooth.svg;
        };
        bluetooth = {
          format-disabled = "off";
          format-off = "off";
          format-on = "no devs";
          format-connected = "{device_battery_percentage}";
          tooltip = false;
        };
        "image#volume" = {
          path = ./assets/volume.svg;
        };
        wireplumber = {
          format = "{volume}";
          format-muted = "M";
          tooltip = false;
        };
      };
    };
    style = with config.lib.stylix.colors.withHashtag; ''
      * {
        all: unset;
        font-family: CommitMono;
        font-size: 12pt;
        font-weight: bold;
      }

      window#waybar {
        background-color: ${base00};
        color: ${base07};
      }

      #workspaces button {
        padding: 0 12px;
      }

      #workspaces button.focused {
        background-color: ${base0C};
        color: ${base00};
      }

      #image {
        background-color: ${base0C};
        padding: 0 9px;
      }

      #wireplumber {
        margin-right: 8px;
      }
    '';
  };
}
