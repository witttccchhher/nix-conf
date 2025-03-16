{ pkgs, config, ... }: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
    
      preload = [ "${config.stylix.image}" ];
    
      wallpaper = [ ", ${config.stylix.image}" ];
    }
    ;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [ ] ++
      (with pkgs.hyprlandPlugins; [
        hyprscroller
          hyprspace
      ]);

    extraConfig = /* toml */ ''
      monitor=,preferred,auto,auto

      $terminal = kitty
      $menu = nwg-drawer

      env = XCURSOR_SIZE,24
      env = HYPRCURSOR_SIZE,24

      general {
          gaps_in = 10
          gaps_out = 20

          border_size = 2

          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)

          resize_on_border = false

          allow_tearing = false

          layout = scroller
      }

      decoration {
          rounding = 20
          rounding_power = 2

          active_opacity = 0.9
          inactive_opacity = 0.8

          shadow {
              enabled = true
              range = 4
              render_power = 3
              color = rgba(1a1a1aee)
          }

          blur {
              enabled = true
              size = 10
              passes = 1

              vibrancy = 0.1696
          }
      }

      animations {
          enabled = yes, please :)

          bezier = easeOutQuint,0.23,1,0.32,1
          bezier = easeInOutCubic,0.65,0.05,0.36,1
          bezier = linear,0,0,1,1
          bezier = almostLinear,0.5,0.5,0.75,1.0
          bezier = quick,0.15,0,0.1,1

          animation = global, 1, 10, default
          animation = border, 1, 5.39, easeOutQuint
          animation = windows, 1, 4.79, easeOutQuint
          animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
          animation = windowsOut, 1, 1.49, linear, popin 87%
          animation = fadeIn, 1, 1.73, almostLinear
          animation = fadeOut, 1, 1.46, almostLinear
          animation = fade, 1, 3.03, quick
          animation = layers, 1, 3.81, easeOutQuint
          animation = layersIn, 1, 4, easeOutQuint, fade
          animation = layersOut, 1, 1.5, linear, fade
          animation = fadeLayersIn, 1, 1.79, almostLinear
          animation = fadeLayersOut, 1, 1.39, almostLinear
          animation = workspaces, 1, 1.94, almostLinear, fade
          animation = workspacesIn, 1, 1.21, almostLinear, fade
          animation = workspacesOut, 1, 1.94, almostLinear, fade
      }

      dwindle {
          pseudotile = true
          preserve_split = true
      }

      master {
          new_status = master
      }

      misc {
          force_default_wallpaper = 0 # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
      }

      input {
          kb_layout = us,ru
          kb_variant =
          kb_model =
          kb_options = grp:caps_toggle
          kb_rules =

          follow_mouse = 1

          sensitivity = 0

          touchpad {
              natural_scroll = false
          }
      }

      gestures {
          workspace_swipe = false
      }

      device {
          name = epic-mouse-v1
          sensitivity = -0.5
      }

      $mod = SUPER # Sets "Windows" key as main modifier

      bind = $mod, Return, exec, $terminal
      bind = $mod, W, killactive,
      bind = $mod SHIFT, Q, exit,
      bind = $mod, T, togglefloating,
      bind = $mod, Space, exec, $menu
      bind = $mod, P, pseudo, # dwindle
      bind = $mod, R, togglesplit, # dwindle
      bind = $mod, O, overview:toggle

      bind = $mod, L, scroller:movefocus, l
      bind = $mod, H, scroller:movefocus, r
      bind = $mod, K, scroller:movefocus, u
      bind = $mod, J, scroller:movefocus, d

      bind = $mod, 1, workspace, 1
      bind = $mod, 2, workspace, 2
      bind = $mod, 3, workspace, 3
      bind = $mod, 4, workspace, 4
      bind = $mod, 5, workspace, 5
      bind = $mod, 6, workspace, 6
      bind = $mod, 7, workspace, 7
      bind = $mod, 8, workspace, 8
      bind = $mod, 9, workspace, 9
      bind = $mod, 0, workspace, 10

      bind = $mod SHIFT, 1, movetoworkspace, 1
      bind = $mod SHIFT, 2, movetoworkspace, 2
      bind = $mod SHIFT, 3, movetoworkspace, 3
      bind = $mod SHIFT, 4, movetoworkspace, 4
      bind = $mod SHIFT, 5, movetoworkspace, 5
      bind = $mod SHIFT, 6, movetoworkspace, 6
      bind = $mod SHIFT, 7, movetoworkspace, 7
      bind = $mod SHIFT, 8, movetoworkspace, 8
      bind = $mod SHIFT, 9, movetoworkspace, 9
      bind = $mod SHIFT, 0, movetoworkspace, 10

      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow

      bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

      windowrulev2 = suppressevent maximize, class:.*

      windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0
    '';
  };
}
