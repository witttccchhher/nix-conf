{ inputs, config, pkgs, ... }: {
  imports = [
    inputs.niri.homeModules.config
  ];

  programs.niri = {
    package = pkgs.niri-unstable;
    config = with config.lib.stylix.colors.withHashtag; /* kdl */ ''
      input {
        keyboard {
          xkb {
            layout "us,ru"
            options "grp:caps_toggle"
          }
        }

        touchpad {
          off
        }

        mouse { }

        trackpoint {
          off
        }

        focus-follows-mouse max-scroll-amount="0%"
      }

      output "HDMI-A-1" {
        mode "1920x1080@60.000"
        position x=0 y=0
        background-color "${base00}"
        scale 1.0
      }

      layout {
        gaps 80
        center-focused-column "never"
        always-center-single-column

        shadow {
          on
          softness 20
          offset x=0 y=0
          color "${base00}33"
        }

        preset-column-widths {
          proportion 0.5
          proportion 1.0
        }
        preset-window-heights {
          proportion 0.5
          proportion 1.0
        }
        default-column-width { proportion 1.0; }

        focus-ring {
          off
        }

        border {
          width 2
          active-color "${base0F}aa"
          inactive-color "${base03}aa"
        }

        insert-hint {
          gradient from="${base0F}aa" to="${base0D}aa" relative-to="workspace-view"
        }
      }

      spawn-at-startup "nwg-drawer" "-c=7" "-nocats" "-fm=nautilus" "-r"
      // spawn-at-startup "ags" "run"
      spawn-at-startup "waybar"
      spawn-at-startup "swaybg" "-i" "${config.stylix.image}"

      prefer-no-csd

      screenshot-path "~/Pictures/Screenshots/Screenshot_from_%Y-%m-%d_%H-%M-%S.png"

      animations { }

      debug {
        disable-resize-throttling
      }

      window-rule {
        geometry-corner-radius 20
        clip-to-geometry true
        draw-border-with-background false
      }

      hotkey-overlay {
        skip-at-startup
      }

      binds {
        Mod+Shift+Slash hotkey-overlay-title="Show this menu" { show-hotkey-overlay; }

        Mod+Return hotkey-overlay-title="Run terminal" { spawn "kitty"; }
        Mod+Space  hotkey-overlay-title="Open launcher" { spawn "nwg-drawer"; }
        Mod+B      hotkey-overlay-title="Lock screen" { spawn "gtklock"; }

        XF86AudioRaiseVolume hotkey-overlay-title="Raise volume" allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"; }
        XF86AudioLowerVolume hotkey-overlay-title="Lower volume" allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"; }
        XF86AudioMute        hotkey-overlay-title="Mute all sounds" allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }

        Mod+W hotkey-overlay-title="Close window" { close-window; }

        Mod+H hotkey-overlay-title=null { focus-column-left; }
        Mod+J hotkey-overlay-title=null { focus-window-or-workspace-down; }
        Mod+K hotkey-overlay-title=null { focus-window-or-workspace-up; }
        Mod+L hotkey-overlay-title=null { focus-column-right; }

        Mod+Shift+H hotkey-overlay-title=null { move-column-left; }
        Mod+Shift+J hotkey-overlay-title=null { move-window-down-or-to-workspace-down; }
        Mod+Shift+K hotkey-overlay-title=null { move-window-up-or-to-workspace-up; }
        Mod+Shift+L hotkey-overlay-title=null { move-column-right; }

        Mod+WheelScrollDown hotkey-overlay-title=null { focus-column-right; }
        Mod+WheelScrollUp   hotkey-overlay-title=null { focus-column-left; }

        Mod+1 hotkey-overlay-title=null { focus-workspace 1; }
        Mod+2 hotkey-overlay-title=null { focus-workspace 2; }
        Mod+3 hotkey-overlay-title=null { focus-workspace 3; }
        Mod+4 hotkey-overlay-title=null { focus-workspace 4; }
        Mod+5 hotkey-overlay-title=null { focus-workspace 5; }
        Mod+6 hotkey-overlay-title=null { focus-workspace 6; }
        Mod+7 hotkey-overlay-title=null { focus-workspace 7; }
        Mod+Shift+1 hotkey-overlay-title=null { move-column-to-workspace 1; }
        Mod+Shift+2 hotkey-overlay-title=null { move-column-to-workspace 2; }
        Mod+Shift+3 hotkey-overlay-title=null { move-column-to-workspace 3; }
        Mod+Shift+4 hotkey-overlay-title=null { move-column-to-workspace 4; }
        Mod+Shift+5 hotkey-overlay-title=null { move-column-to-workspace 5; }
        Mod+Shift+6 hotkey-overlay-title=null { move-column-to-workspace 6; }
        Mod+Shift+7 hotkey-overlay-title=null { move-column-to-workspace 7; }

        Mod+Tab hotkey-overlay-title="Switch to previous worksapce" { focus-workspace-previous; }

        Mod+T hotkey-overlay-title="Toggle window floating" { toggle-window-floating; }

        Mod+Comma  hotkey-overlay-title="Consume window into column" { consume-window-into-column; }
        Mod+Period hotkey-overlay-title="Expel window from column" { expel-window-from-column; }

        Mod+BracketLeft  { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }
       
        Mod+R { switch-preset-column-width; }
        Mod+Shift+R { switch-preset-window-height; }
        Mod+Ctrl+R { reset-window-height; }
        Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }
        Mod+C { center-column; }

        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }

        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        Print { screenshot; }
        Mod+Print { screenshot-screen; }
        Shift+Print { screenshot-window; }

        Mod+Shift+Q { quit; }
      }
    '';
  };
}
