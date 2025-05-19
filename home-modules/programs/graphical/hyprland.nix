{
  pkgs,
  config,
  ...
}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      preload = [ "${config.stylix.image}" ];
      wallpaper = [ ", ${config.stylix.image}" ];
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig =
      with config.lib.stylix.colors; # hyprlang
      ''
        monitor=,preferred,auto,auto

        $terminal = kitty
        $menu = ags toggle Launcher

        env = XCURSOR_SIZE,24
        env = HYPRCURSOR_SIZE,24

        general {
          gaps_in = 10
          gaps_out = 20

          border_size = 0
          col.active_border = rgba(${base0F}aa)
          col.inactive_border = rgba(${base03}aa)
          resize_on_border = false

          allow_tearing = false

          layout = scroller
          no_focus_fallback = true
        }

        decoration {
          rounding = 20

          active_opacity = 1.0
          inactive_opacity = 1.0

          shadow {
            enabled = false
            range = 4
            render_power = 3
            color = rgba(${base00}33)
          }

          blur {
            enabled = true
            size = 5
            passes = 2

            noise = 0.0117
            contrast = 0.8916
            brightness = 0.8172
            vibrancy = 0.1696
          }
        }

        animations {
          enabled = true

          bezier = easeOutQuint,0.23,1,0.32,1
          bezier = easeInOutCubic,0.65,0.05,0.36,1
          bezier = linear,0,0,1,1
          bezier = almostLinear,0.5,0.5,0.75,1.0
          bezier = quick,0.15,0,0.1,1

          animation = global, 1, 10, default
          animation = border, 1, 5.39, easeOutQuint
          animation = windows, 1, 4.79, easeInOutCubic
          animation = windowsIn, 1, 4.1, easeInOutCubic, popin 87%
          animation = windowsOut, 1, 1.49, easeInOutCubic, popin 87%
          animation = fadeIn, 1, 1.73, almostLinear
          animation = fadeOut, 1, 1.46, almostLinear
          animation = fade, 1, 3.03, quick
          animation = layers, 1, 3.81, easeOutQuint
          animation = layersIn, 1, 4, easeOutQuint, fade
          animation = layersOut, 1, 1.5, linear, fade
          animation = fadeLayersIn, 1, 1.79, almostLinear
          animation = fadeLayersOut, 1, 1.39, almostLinear
          animation = workspaces, 1, 1.94, easeInOutCubic, slidefadevert 20%
          animation = workspacesIn, 1, 1.21, easeInOutCubic, slidefadevert 20%
          animation = workspacesOut, 1, 1.94, easeInOutCubic, slidefadevert 20%
        }

        misc {
          force_default_wallpaper = 0
          disable_hyprland_logo = true
          font_family = CommitMono
          focus_on_activate = true
          middle_click_paste = false
        }

        input {
          kb_layout = us,ru
          kb_options = grp:caps_toggle

          follow_mouse = false
        }

        ecosystem {
          no_donation_nag = true
        }

        plugin {
          scroller {
            column_widths = onehalf, one
            window_heights = one
            column_default_width = one
            window_default_height = one
          }
        }

        exec-once = ags run

        $mod = SUPER

        bind = $mod, Return, exec, $terminal
        bind = $mod, W, killactive,
        bind = $mod SHIFT, Q, exit,
        bind = $mod, T, togglefloating,
        bind = $mod, F, fullscreen
        bind = $mod, Space, exec, $menu
        # bind = $mod, Tab, overview:toggle
        # bind = $mod, Tab, scroller:toggleoverview
        bind = $mod, Tab, exec, ags toggle Menu
        bind = $mod, Q, scroller:cyclewidth

        bind = $mod, L, scroller:movefocus, r
        bind = $mod, H, scroller:movefocus, l
        bind = $mod, K, workspace, -1
        bind = $mod, J, workspace, +1

        bind = $mod SHIFT, L, scroller:movewindow, r
        bind = $mod SHIFT, H, scroller:movewindow, l
        bind = $mod SHIFT, K, movetoworkspace, -1
        bind = $mod SHIFT, J, movetoworkspace, +1

        bindm = $mod, mouse:272, movewindow
        bindm = $mod, mouse:273, resizewindow

        bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

        windowrulev2 = suppressevent maximize, class:.*
        windowrulev2 = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0

        layerrule = blur, gtk-layer-shell
        layerrule = ignorezero, gtk-layer-shell
      '';
  };
}
