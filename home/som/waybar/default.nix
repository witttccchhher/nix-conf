{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      # default = {
      #   layer = "bottom";
      #   position = "top";
      #   height = 52;
      #   width = 1920;
      #   spacing = 10;
      #   reload_style_on_change = true;
      #   modules-left = [ "group/app" ];
      #   modules-center = [ "sway/workspaces" ];
      #   modules-right = [ "group/wifi" "group/volume" "clock" ];
      #   "group/app" = {
      #     orientation = "vertical";
      #     modules = [ "sway/window#appid" "sway/window#name" ];
      #   };
      #   "sway/window#appid" = {
      #     format = "{app_id}";
      #     max-length = 35;
      #     rewrite = {
      #       "^$" = "Desktop";
      #     };
      #     tooltip = false;
      #   };
      #   "sway/window#name" = {
      #     format = "{title}";
      #     max-length = 35;
      #     rewrite = {
      #       "^$" = "Workspace $";
      #       "foot" = "Foot terminal";
      #       "materialgram (.*)" = "materialgram";
      #     };
      #     tooltip = false;
      #   };
      #   "sway/workspaces" = {
      #     persistent-workspaces = {
      #       "1" = [];
      #       "2" = [];
      #       "3" = [];
      #       "4" = [];
      #       "5" = [];
      #       "6" = [];
      #       "7" = [];
      #     };
      #     format = "{icon}";
      #     format-icons = {
      #       "1" = "1";
      #       "2" = "2";
      #       "3" = "3";
      #       "4" = "4";
      #       "5" = "5";
      #       "6" = "6";
      #       "7" = "7";
      #       "focused" = "";
      #     };
      #     disable-scroll = true;
      #     tooltip = false;
      #   };
      #   "group/wifi" = {
      #     orientation = "horizontal";
      #     modules = [ "image#network" "network#ssid" ];
      #   };
      #   "image#network" = {
      #     path = "${./assets/wifi.png}";
      #     size = 18;
      #     tooltip = false;
      #   };
      #   "network#ssid" = {
      #     interval = 60;
      #     format = "{essid}";
      #     tooltip = false;
      #   };
      #   "group/volume" = {
      #     orientation = "horizontal";
      #     modules = [ "image#alsa" "custom/alsa" ];
      #   };
      #   "image#alsa" = {
      #     path = "${./assets/volume.png}";
      #     size = 18;
      #     tooltip = false;
      #   };
      #   "custom/alsa" = {
      #     exec = "amixer get Master | grep -m1 -o '[0-9]*%' --color=never";
      #     interval = 1;
      #     tooltip = false;
      #   };
      #   "clock" = {
      #     interval = 1;
      #     format = "{:%H:%M  %A, %d/%m}";
      #     tooltip = false;
      #   };
      # };
      mac = let
        batteryBin = pkgs.writeShellScriptBin "battery" ''
          battery=$(upower --enumerate | head -1)
          percentage=$(upower -i $battery | awk '/percentage/{gsub("%", ""); print $2}')

          if (( "$percentage" >= 0 && "$percentage" < 13 )); then
            echo ${./assets/battery0.png}
          elif (( "$percentage" >= 13 && "$percentage" < 25 )); then
            echo ${./assets/battery1.png}
          elif (( "$percentage" >= 25 && "$percentage" < 38 )); then
            echo ${./assets/battery2.png}
          elif (( "$percentage" >= 38 && "$percentage" < 50 )); then
            echo ${./assets/battery3.png}
          elif (( "$percentage" >= 50 && "$percentage" < 63 )); then
            echo ${./assets/battery4.png}
          elif (( "$percentage" >= 63 && "$percentage" < 75 )); then
            echo ${./assets/battery5.png}
          elif (( "$percentage" >= 75 && "$percentage" < 88 )); then
            echo ${./assets/battery6.png}
          elif (( "$percentage" >= 88 && "$percentage" <= 100 )); then
            echo ${./assets/battery6.png}
          fi
        '';
        wifiBin = pkgs.writeShellScriptBin "wifi" ''
          quality=$(iwconfig 2> /dev/null | awk '
            /Link Quality/ {
              split($0, a, "=")
              split(a[2], b, "/")
              current_link_quality = b[1]
              max_link_quality = b[2]
              link_quality_percent = (current_link_quality / max_link_quality) * 100
              printf("%d\n", int(link_quality_percent + 0.5))
            }
          ')

          if (( "$quality" >= 0 && "$quality" < 20 )); then
            echo ${./assets/wifi0.png}
          elif (( "$quality" >= 20 && "$quality" < 40 )); then
            echo ${./assets/wifi1.png}
          elif (( "$quality" >= 40 && "$quality" < 60 )); then
            echo ${./assets/wifi2.png}
          elif (( "$quality" >= 60 && "$quality" < 80 )); then
            echo ${./assets/wifi3.png}
          elif (( "$quality" >= 80 && "$quality" <= 100 )); then
            echo ${./assets/wifi3.png}
          fi
        '';
      in {
        layer = "bottom";
        position = "top";
        height = 52;
        width = 1920;
        spacing = 20;
        reload_style_on_change = true;
        modules-left = [ "image#nixos" "sway/window" "custom/files" "custom/edit" "custom/view" "custom/term" "custom/chat" "custom/help" ];
        modules-center = [];
        modules-right = [ "image#network" "image#battery" "image#toggles" "clock" ];
        "image#nixos" = {
          path = "${./assets/nixos.png}";
          size = 20;
          tooltip = false;
        };
        "sway/window" = {
          format = "{app_id}";
          tooltip = false;
          rewrite = {
            "^$" = "Desktop";
            "zen-beta" = "Zen";
            "footclient" = "Foot";
            "io.github.tdesktop_x64.TDesktop" = "Telegram";
            "org.pwmt.zathura" = "Zathura";
            "org.gnome.Calculator" = "Calculator";
            "eog" = "Eye of Gnome";
            "org.gnome.Nautilus" = "Files";
            "org.gnome.Solanum" = "Pomodoro";
          }
        };
        "custom/files" = {
          format = "Files";
          on-click = "footclient -e yazi";
          tooltip = false;
        };
        "custom/edit" = {
          format = "Edit";
          on-click = "footclient -e nvim";
          tooltip = false;
        };
        "custom/view" = {
          format = "View";
          on-click = "zen";
          tooltip = false;
        };
        "custom/term" = {
          format = "Term";
          on-click = "footclient";
          tooltip = false;
        };
        "custom/chat" = {
          format = "Chat";
          on-click = "telegram-desktop";
          tooltip = false;
        };
        "custom/help" = {
          format = "Help";
          on-click = "xdg-open 'https://nixos.wiki'";
          tooltip = false;
        };
        "image#battery" = {
          exec = "${pkgs.lib.getExe batteryBin}";
          on-click = "footclient -e btop";
          interval = 300;
          size = 24;
          tooltip = false;
        };
        "image#network" = {
          exec = "${pkgs.lib.getExe wifiBin}";
          on-click = "footclient -e nmtui";
          interval = 15;
          size = 20;
          tooltip = false;
        };
        "image#toggles" = {
          path = "${./assets/toggles.png}";
          size = 18;
          tooltip = false;
        };
        "clock" = {
          interval = 60;
          on-click = "solanum";
          tooltip = false;
        };
      };
    };
    style = builtins.readFile ./style.css;
  };
}
