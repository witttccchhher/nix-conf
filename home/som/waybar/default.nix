{ pkgs, config, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      neo = {
        name = "Test";
        layer = "bottom";
        position = "bottom";
        height = 46;
        width = 1920;
        spacing = 10;
        reload_style_on_change = true;
        modules-left = [
          "image#nix"
          "sway/window"
          "image#language"
          "sway/language"
          "image#network"
          "network"
        ];
        modules-center = [
          "sway/workspaces"
        ];
        modules-right = [
          "image#volume"
          "wireplumber"
          "image#battery"
          "battery"
          "image#clock"
          "clock"
        ];
        "image#nix" = {
          path = "${./assets/nix.png}";
          size = 23;
          tooltip = false;
        };
        "sway/window" = {
          format = "{app_id}";
          rewrite = {
            "^$" = "workspace";
          };
          tooltip = false;
        };
        "image#language" = {
          path = "${./assets/lang.svg}";
          size = 17;
          tooltip = false;
        };
        "sway/language" = {
          tooltip = false;
        };
        "image#network" = {
          path = "${./assets/net.svg}";
          size = 17;
          tooltip = false;
        };
        "network" = {
          interval = 10;
          format = "{signalStrength} ETH";
          tooltip = false;
        };
        "sway/workspaces" = {
          disable-scroll = true;
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
          };
          format = "{icon}";
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
          };
          tooltip = false;
        };
        "image#volume" = {
          path = "${./assets/vol.svg}";
          size = 20;
          tooltip = false;
        };
        "wireplumber" = {
          format = "{volume}";
          format-muted = "muted";
          tooltip = false;
        };
        "image#battery" = {
          path = "${./assets/bat.svg}";
          size = 20;
          tooltip = false;
        };
        "battery" = {
          format = "{capacity}";
          tooltip = false;
        };
        "image#clock" = {
          path = "${./assets/clock.svg}";
          size = 20;
          tooltip = false;
        };
        "clock" = {
          format = "{:%d %b<span foreground=\"#f17ac6\">,</span>  %H<span foreground=\"#f17ac6\">:</span>%M}";
          interval = 60;
          tooltip = false;
        };
      };
    };
    style = with config.lib.stylix.colors.withHashtag; /* css */ ''
      * {
        all: unset;
        font-family: Inter;
        font-size: 16px;
        font-weight: 700;
      }

      window#waybar {
        background-color: ${base00};
        color: ${base07};
      }

      #image.nix {
        margin-left: 20px;
      }

      #image.language {
        margin-left: 15px;
      }

      #workspaces button {
        background-color: ${base03};
        margin: 7px 3px;
        padding: 8px;
        border-radius: 100px;
      }
      #workspaces button.focused {
        background: linear-gradient(315deg, ${base0C} 15%, ${base0E} 85%);
      }

      #image.clock {
        margin-left: 15px;
      }

      #clock {
        margin-right: 20px;
      }
      #clock span {
        background-color: ${base0C};
      }
    '';
  };
}
