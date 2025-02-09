{ pkgs, config, ... }: {
  programs.zellij = {
    enable = false;
    enableZshIntegration = true;
  };

  xdg.configFile."zellij/config.kdl".text = with config.lib.stylix.colors.withHashtag; ''
    on_force_close "quit"
    simplified_ui true
    default_shell "zsh"
    pane_frames false
    theme "default"
    default_layout "compact"
    default_mode "normal"
    mouse_mode false
    scroll_buffer_size 2000
    copy_command "wl-copy"
    copy_clipboard "system"
    copy_on_select false
    scrollback_editor "${pkgs.neovim}/bin/nvim"
    mirror_session false
    env { }
    ui {
      pane_frames {
        rounded_corners false
        hide_session_name true
      }
    }
    auto_layout true
    styled_underlines true
    session_serialization true
    pane_viewport_serialization false
    disable_session_metadata false

    themes {
      default {
        fg "${base07}"
        bg "${base00}"
        black "${base02}"
        red "${base08}"
        green "${base0B}"
        yellow "${base0A}"
        blue "${base0D}"
        magenta "${base0E}"
        cyan "${base0C}"
        white "${base06}"
        orange "${base09}"
      }
    }

    keybinds clear-defaults=true {
      normal {
        bind "Alt Enter" { NewPane; }
        bind "Alt w" { CloseFocus; }

        bind "Alt t" { NewTab; }
        bind "Alt q" { CloseTab; }

        bind "Alt j" { MoveFocus "Down"; }
        bind "Alt k" { MoveFocus "Up"; }
        bind "Alt h" { MoveFocus "Left"; }
        bind "Alt l" { MoveFocus "Right"; }

        bind "Alt Shift j" { MovePane "Down"; }
        bind "Alt Shift k" { MovePane "Up"; }
        bind "Alt Shift h" { MovePane "Left"; }
        bind "Alt Shift l" { MovePane "Right"; }

        bind "Alt Ctrl j" { Resize "Down"; }
        bind "Alt Ctrl k" { Resize "Up"; }
        bind "Alt Ctrl h" { Resize "Left"; }
        bind "Alt Ctrl l" { Resize "Right"; }

        bind "Alt Tab" { GoToNextTab; }
        bind "Alt Shift Tab" { GoToPreviousTab; }

        bind "Alt Space" { NextSwapLayout; }

        bind "Alt f" { ToggleFloatingPanes; }

        bind "Alt s" { SwitchToMode "entersearch"; }
      }

      entersearch {
        bind "Enter" { SwitchToMode "search"; }
        bind "Esc" { SwitchToMode "normal"; }
      }

      search {
        bind "n" { Search "down"; }
        bind "Shift n" { Search "up"; }
        bind "Esc" { SwitchToMode "normal"; }
      }
    }
  '';
}
