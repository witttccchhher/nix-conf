{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      default = {
        layer = "bottom";
        position = "top";
        height = 52;
        width = 1920;
        spacing = 10;
        reload_style_on_change = true;
        modules-left = [ "group/app" ];
        modules-center = [ "sway/workspaces" ];
        modules-right = [ "group/wifi" "group/volume" "clock" ];
        "group/app" = {
          orientation = "vertical";
          modules = [ "sway/window#appid" "sway/window#name" ];
        };
        "sway/window#appid" = {
          format = "{app_id}";
          max-length = 35;
          rewrite = {
            "^$" = "Desktop";
          };
          tooltip = false;
        };
        "sway/window#name" = {
          format = "{title}";
          max-length = 35;
          rewrite = {
            "^$" = "Workspace $";
            "foot" = "Foot terminal";
            "materialgram (.*)" = "materialgram";
          };
          tooltip = false;
        };
        "sway/workspaces" = {
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
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "focused" = "";
          };
          disable-scroll = true;
          tooltip = false;
        };
        "group/wifi" = {
          orientation = "horizontal";
          modules = [ "image#network" "network#ssid" ];
        };
        "image#network" = {
          path = "${./assets/wifi.png}";
          size = 18;
          tooltip = false;
        };
        "network#ssid" = {
          interval = 60;
          format = "{essid}";
          tooltip = false;
        };
        "group/volume" = {
          orientation = "horizontal";
          modules = [ "image#alsa" "custom/alsa" ];
        };
        "image#alsa" = {
          path = "${./assets/volume.png}";
          size = 18;
          tooltip = false;
        };
        "custom/alsa" = {
          exec = "amixer get Master | grep -m1 -o '[0-9]*%' --color=never";
          interval = 1;
          tooltip = false;
        };
        "clock" = {
          interval = 1;
          format = "{:%H:%M  %A, %d/%m}";
          tooltip = false;
        };
      };
    };
    style = builtins.readFile ./style.css;
  };
}
