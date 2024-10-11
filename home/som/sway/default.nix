{ pkgs, config, inputs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    xwayland = true;

    extraConfig = ''
      include /etc/sway/config.d/*
    '';

    extraConfigEarly = ''
      output LVDS-1 disable

      set $raise_vol amixer sset Master 1%+
      set $lower_vol amixer sset Master 1%-
      set $mute amixer sset Master toggle
    '';

    config = {
      terminal = "foot";
      menu = "anyrun";

      output = {
        HDMI-A-1 = {
          bg = "${inputs.wallpapers}/chocolate/samurai.png fill";
          resolution = "1920x1080";
          position = "0,0";
        };
      };

      startup = [
        { command = "ags"; always = true; }
        { command = "autotiling"; always = true; }
      ];

      workspaceLayout = "default";
      defaultWorkspace = "workspace number 1";
      focus.followMouse = true;
      bars = [ { command = "${pkgs.waybar}/bin/waybar"; } ];
      gaps.inner = 20;

      floating.border = 0;
      window = {
        commands = [
          {
            command = "floating enable, sticky enable";
            criteria = { class = "Com.github.Aylur.ags"; };
          }
          {
            command = "floating enable";
            criteria = { class = "main.py"; };
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
          ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | wl-copy
          ags -r "Utils.notify({ summary: 'Screenhot takes', body: 'Copied to clipboard' })"
        '';
      in {
        "XF86AudioRaiseVolume" = "exec $raise_vol";
        "XF86AudioLowerVolume" = "exec $lower_vol";
        "XF86AudioMute" = "exec $mute";

        "${mod}+Return" = "exec ${config.wayland.windowManager.sway.config.terminal}";
        "Print" = "exec ${pkgs.lib.getExe takescreenshot}";
        "${mod}+w" = "kill";
        "${mod}+space" = "exec ${config.wayland.windowManager.sway.config.menu}";
        "${mod}+Shift+r" = "reload";
        "${mod}+Shift+q" = "exec 'swaymsg exit'";

        "${mod}+Left" = "focus left";
        "${mod}+Right" = "focus right";
        "${mod}+Up" = "focus up";
        "${mod}+Down" = "focus down";

        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Right" = "move right";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Down" = "move down";

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

        "${mod}+l" = "exec ${pkgs.gtklock}/bin/gtklock";

        "${mod}+f" = "fullscreen";
        "${mod}+t" = "floating toggle";
      };
    };
  };
}
