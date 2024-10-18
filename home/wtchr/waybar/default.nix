{ pkgs, config, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      pixels = {
        layer = "bottom";
        position = "top";
        height = 40;
        width = 1920;
        spacing = 0;
        reload_style_on_change = true;
        modules-left = [ "custom/nixos" "sway/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "image#network" "network" "image#language" "sway/language" "image#alsa" "custom/alsa" ];
        "custom/nixos" = {
          format = "Nix";
          tooltip = false;
        };
        "sway/workspaces" = {
          all-outputs = false;
          format = "{index}";
          disable-scroll = false;
          tooltip = false;
        };
        "clock" = {
          interval = 1;
          format = "{:%d %B, %H:%M:%S}";
          tooltip = false;
        };
        "image#network" = {
          path = assets/wifi.png;
          size = 20;
          tooltip = false;
        };
        "network" = {
          interval = 60;
          format = "{essid}";
          tooltip = false;
        };
        "image#language" = {
          path = assets/language.png;
          size = 20;
          tooltip = false;
        };
        "sway/language" = {
          format = "{}";
          tooltip = false;
        };
        "image#alsa" = {
          path = assets/volume.png;
          size = 20;
          tooltip = false;
        };
        "custom/alsa" = {
          exec = "amixer get Master | grep -m1 -o '[0-9]*%' --color=never";
          interval = 1;
          tooltip = false;
        };
      };
    };
    style = with config.lib.stylix.colors; ''
      * {
        all: unset;
        font-family: scientifica;
        font-size: 22px;
        color: #${base00};
      }

      window#waybar {
        background-color: #${base02};
      }

      #workspaces button label {
        color: #${base05};
        margin: 7px;
      }

      #workspaces button.focused label {
        padding: 0 7px 0 7px;
        background-color: #${base0C};
        color: #${base00};
        border-radius: 2px;
      }

      #clock, #image.network, #image.alsa, #image.language, #custom-nixos {
        background-color: #${base0C};
        margin: 6px;
        padding: 0 4px 0 4px;
        border-radius: 2px;
      }

      #network, #custom-alsa, #language {
        padding: 0 7px 0 7px;
        color: #${base05};
      }
    '';
  };
}
