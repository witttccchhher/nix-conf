{ pkgs, config, inputs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    xwayland = true;

    extraConfig = ''
      include /etc/sway/config.d/*
    '';

    extraConfigEarly = ''
      output LVDS-1 disable

      blur disable
      corner_radius 15
      default_dim_inactive 0.15
      shadows enable
      shadow_blur_radius 6
      shadow_color #${config.lib.stylix.colors.base00}ff
      layer_effects "waybar" shadows disable; corner_radius 0; blur disable

      set $raise_vol amixer sset Master 1%-
      set $lower_vol amixer sset Master 1%-
      set $mute amixer sset Master toggle
    '';

    config = {
      terminal = "footclient";
      menu = "nwg-drawer";

      output = {
        HDMI-A-1 = {
          bg = "${config.stylix.image} fill";
          resolution = "1920x1080";
          position = "0,0";
        };
      };

      startup = [
        { command = "autotiling"; always = true; }
        { command = "foot --server"; }
        { command = "nwg-drawer -c=7 -nocats -fm=nautilus -r"; always = true; }
        { command = "ags run"; }
      ];

      workspaceLayout = "default";
      defaultWorkspace = "workspace number 1";
      focus.followMouse = true;
      fonts = {
        names = [ "CaskaydiaMono Nerd Font" ];
        style = "Regular";
        size = 12.0;
      };
      bars = [ 
        { command = "${pkgs.waybar}/bin/waybar"; }
      ];
      gaps = {
        inner = 20;
        outer = 20;
      };
      colors = with config.lib.stylix.colors.withHashtag; {
        background = "${base00}";
        focused = {
          background = "${base00}";
          border = "${base02}";
          childBorder = "${base02}";
          indicator = "${base02}";
          text = "${base07}";
        };
        focusedInactive = {
          background = "${base00}";
          border = "${base02}";
          childBorder = "${base02}";
          indicator = "${base02}";
          text = "${base07}";
        };
        unfocused = {
          background = "${base00}";
          border = "${base02}";
          childBorder = "${base02}";
          indicator = "${base02}";
          text = "${base07}";
        };
        urgent = {
          background = "${base00}";
          border = "${base08}";
          childBorder = "${base08}";
          indicator = "${base08}";
          text = "${base07}";
        };
        placeholder = {
          background = "${base00}";
          border = "${base02}";
          childBorder = "${base02}";
          indicator = "${base02}";
          text = "${base07}";
        };
      };

      floating = {
        border = 0;
        titlebar = false;
      };
      window = {
        commands = [
          {
            command = "floating enable, sticky enable";
            criteria = { class = "Com.github.Aylur.ags"; };
          }
          {
            command = "floating enable";
            criteria = { class = "Org.gnome.Solanum"; };
          }
        ];
        border = 0;
        titlebar = false;
      };

      input = {
        "*" = {
          xkb_layout = "us,ru";
          xkb_options = "grp:caps_toggle";
        };
      };

      modifier = "Mod4";
      floating.modifier = "${config.wayland.windowManager.sway.config.modifier}";
      bindkeysToCode = true;
      keybindings = let
        mod = config.wayland.windowManager.sway.config.modifier;
        takescreenshot = pkgs.writeShellScriptBin "takescreenshot" ''
          filename="/tmp/screenshots/$(date "+%d.%m.%y_%H:%M:%S_grim.png")"
          ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" "$filename"

          if [ -f "$filename" ]; then
            ${pkgs.wl-clipboard}/bin/wl-copy < "$filename"
            notifyRes=$(timeout 10s ${pkgs.libnotify}/bin/notify-send -A 'Save' -A 'Open' -a 'Grimblast' 'Screenshot taken' 'Copied to clipboard' -h string:image-path:$filename -i ${./screenshot.svg})

            if [[ "$notifyRes" == 0 ]]; then
              mv "$filename" ~/Pictures/Screenshots
            elif [[ "$notifyRes" == 1 ]]; then
              ${pkgs.eog}/bin/eog "$filename"
              rm "$filename"
            else
              rm "$filename"
            fi
          fi
        '';
      in {
        "XF86AudioRaiseVolume" = "exec $raise_vol";
        "XF86AudioLowerVolume" = "exec $lower_vol";
        "XF86AudioMute" = "exec $mute";

        "${mod}+Return" = "exec ${config.wayland.windowManager.sway.config.terminal}";
        "${mod}+Shift+Return" = "exec ${pkgs.neovide}/bin/neovide";
        "Print" = "exec ${pkgs.lib.getExe takescreenshot}";
        "${mod}+w" = "kill";
        "${mod}+space" = "exec ${config.wayland.windowManager.sway.config.menu}";
        "${mod}+Tab" = "exec ags toggle Menu";
        "${mod}+Shift+r" = "reload";
        "${mod}+Shift+q" = "exec 'swaymsg exit'";

        "${mod}+h" = "focus left";
        "${mod}+l" = "focus right";
        "${mod}+k" = "focus up";
        "${mod}+j" = "focus down";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+j" = "move down";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";

        "${mod}+b" = "exec ${pkgs.gtklock}/bin/gtklock --idle-hide --idle-timeout 2 --start-hidden";

        "${mod}+f" = "fullscreen";
        "${mod}+t" = "floating toggle";
      };
    };
  };
}
