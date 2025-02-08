{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    on_force_close "quit"
    simplified_ui true
    default_shell "zsh"
    pane_frames false
    theme "default"
    default_layout "default"
    default_mode "normal"
    mouse_mode false
    scroll_buffer_size 2000
    copy_command "wl-copy"
    copy_clipboard "system"
    copy_on_select false
    scrollback_editor "${pkgs.neovim}/bin/nvim"
    mirror_session false
    // layout_dir "${./layouts}"
    // theme_dir "${./themes}"
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

    keybinds clear-defaults=true {
      normal {
        bind "Alt Enter" { NewPane; }
      }
    }
  '';
}
