{ w, pkgs, inputs, ... }:
{
  imports = [ inputs.niri.homeModules.niri ];

  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.system}.niri-unstable;

    config = ''
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

          mouse {
              accel-profile "flat"
          }

          trackpoint {
              off
          }

          focus-follows-mouse max-scroll-amount="0%"
      }

      output "HDMI-A-1" {
          mode "1920x1080@74.973"
          scale 1
          transform "normal"
          position x=0 y=0
      }

      layout {
          gaps 30

          background-color "#ffffff"

          center-focused-column "on-overflow"

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
            off
          }

          shadow {
              on
              softness 20
              spread 3
              offset x=0 y=0
              color "#0009"
          }

          insert-hint {
        color "#0007"
          }

          struts {
        top 20
        bottom 20
        left 20
        right 20
          }
      }

      spawn-at-startup "waybar"
      spawn-at-startup "swaybg" "-i" "${w.wallpaper}"

      screenshot-path "~/Pictures/Screenshots/Screenshot_from_%Y-%m-%d_%H-%M-%S.png"

      hotkey-overlay {
          skip-at-startup
      }

      gestures {
          hot-corners {
              off
          }
      }

      overview {
          zoom 0.5
          backdrop-color "#000"
      }

      window-rule {
          geometry-corner-radius 10
          clip-to-geometry true
      }

      binds {
          Mod+Return           { spawn "kitty"; }
          Mod+Space            { spawn "tofi-drun"; }
          Mod+W                { close-window; }
          Mod+Tab repeat=false { toggle-overview; }

          XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"; }
          XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"; }
          XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }

          Mod+H     { focus-column-left; }
          Mod+J     { focus-window-or-workspace-down; }
          Mod+K     { focus-window-or-workspace-up; }
          Mod+L     { focus-column-right; }

          Mod+Shift+H     { move-column-left; }
          Mod+Shift+J     { move-window-down-or-to-workspace-down; }
          Mod+Shift+K     { move-window-up-or-to-workspace-up; }
          Mod+Shift+L     { move-column-right; }

          Mod+BracketLeft  { consume-or-expel-window-left; }
          Mod+BracketRight { consume-or-expel-window-right; }

          Mod+R       { switch-preset-column-width; }
          Mod+Shift+R { switch-preset-window-height; }
          Mod+Ctrl+R  { reset-window-height; }
          Mod+F       { maximize-column; }
          Mod+Shift+F { fullscreen-window; }

          Mod+Minus { set-column-width "-10%"; }
          Mod+Equal { set-column-width "+10%"; }

          Mod+Shift+Minus { set-window-height "-10%"; }
          Mod+Shift+Equal { set-window-height "+10%"; }

          Mod+T       { toggle-window-floating; }
          Mod+Shift+T { switch-focus-between-floating-and-tiling; }

          Print     { screenshot; }
          Alt+Print { screenshot-screen; }

          Mod+Shift+Q { quit; }
      }
    '';
  };
}
