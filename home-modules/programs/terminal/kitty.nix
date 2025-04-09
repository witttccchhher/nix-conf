{ config, ... }: {
  programs.kitty = {
    enable = true;
    extraConfig = with config.lib.stylix.colors.withHashtag; ''
      font_family      CommitMono
      bold_font        auto
      italic_font      CommitMonoV143
      bold_italic_font auto

      font_size 12.0
      disable_ligatures always

      font_features CommitMono-Regular +calt +ss01 +ss02 +ss03 +ss04 +ss05 +cv01 +cv02 +cv03 +cv04 +cv05 +cv06 +cv08 +cv09 +cv10 +cv11
      font_features CommitMono-Bold +calt +ss01 +ss02 +ss03 +ss04 +ss05 +cv01 +cv02 +cv03 +cv04 +cv05 +cv06 +cv08 +cv09 +cv10 +cv11
      font_features CommitMonoV143-Italic +calt +ss01 +ss02 +ss03 +ss04 +ss05 +cv01 +cv02 +cv03 +cv04 +cv05 +cv06 +cv08 +cv09 +cv10 +cv11
      font_features CommitMonoV143-BoldItalic +calt +ss01 +ss02 +ss03 +ss04 +ss05 +cv01 +cv02 +cv03 +cv04 +cv05 +cv06 +cv08 +cv09 +cv10 +cv11

      undercurl_style thick-sparse

      cursor ${base07}
      cursor_text_color ${base00}
      cursor_shape block
      cursor_shape_unfocused unchanged
      cursor_blink_interval 0
      cursor_trail 3
      cursor_trail_start_threshold 0

      scrollback_lines 1000

      window_padding_width 16

      mouse_hide_wait 1.0

      url_color ${base0D}
      url_style curly
      open_url_with default
      url_prefixes file ftp ftps git http https ssh
      detect_urls yes
      underline_hyperlinks always

      copy_on_select no
      paste_actions quote-urls-at-prompt
      strip_trailing_spaces always

      mouse_map left click ungrabbed link
      mouse_map left press ungrabbed mouse_selection normal
      mouse_map left doublepress ungrabbed
      mouse_map left triplepress ungrabbed
      mouse_map middle release ungrabbed

      sync_to_monitor yes

      enable_audio_bell no

      remember_window_size no
      initial_window_width  800
      initial_window_height 600
      window_resize_step_cells 1
      window_resize_step_lines 1
      confirm_os_window_close 0
      hide_window_decorations yes

      tab_bar_edge top
      tab_bar_margin_width 0.0
      tab_bar_margin_height 0.0 0.0
      tab_bar_style powerline
      tab_bar_align left
      tab_bar_min_tabs 2
      tab_switch_strategy previous
      tab_powerline_style round
      tab_title_template "{tab.active_exe}"
      active_tab_foreground ${base00}
      active_tab_background ${base07}
      active_tab_font_style bold
      inactive_tab_foreground ${base00}
      inactive_tab_background ${base06}
      inactive_tab_font_style normal

      foreground ${base06}
      background ${base00}

      dim_opacity 0.5

      selection_foreground ${base00}
      selection_background ${base07}

      color0 ${base00}
      color8 ${base04}

      color1 ${base08}
      color9 ${base08}

      color2  ${base0B}
      color10 ${base0B}

      color3  ${base0A}
      color11 ${base0A}

      color4  ${base0D}
      color12 ${base0D}

      color5  ${base0F}
      color13 ${base0F}

      color6  ${base0C}
      color14 ${base0C}

      color7  ${base07}
      color15 ${base07}

      allow_remote_control no
      update_check_interval 0
      allow_hyperlinks yes
      # shell_integration enabled
      term xterm-kitty

      linux_display_server wayland

      kitty_mod alt
      clear_all_shortcuts yes

      map ctrl+c copy_and_clear_or_interrupt
      map ctrl+v paste_from_clipboard

      map kitty_mod+k scroll_line_up
      map kitty_mod+j scroll_line_down

      map kitty_mod+r load_config_file
    '';
  };
}
