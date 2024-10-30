{ config, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = true;
      window = {
        dimensions = { columns = 70; lines = 25; };
        padding = { x = 7; y = 7; };
        decorations = "None";
      };
      font = {
        normal = { family = "JetBrainsMono Nerd Font"; style = "Regular"; };
        bold = { family = "JetBrainsMono Nerd Font"; style = "Bold"; };
        italic = { family = "JetBrainsMono Nerd Font"; style = "Italic"; };
        size = 15;
      };
      cursor = {
        style = { shape = "Block"; blinking = "On"; };
        vi_mode_style = { shape = "Block"; blinking = "On"; };
        blink_interval = 800;
        blink_timeout = 0;
        unfocused_hollow = false;
      };
      colors = with config.lib.stylix.colors; {
        primary = {
          foreground = "#${base05}";
          background = "#${base00}";
        };
        cursor = { text = "CellBackground"; cursor = "CellForeground"; };
        vi_mode_cursor = { text = "CellBackground"; cursor = "CellForeground"; };
        selection = { text = "CellBackground"; background = "CellForeground"; };
        normal = {
          black = "#${base00}";
          red = "#${base08}";
          green = "#${base0B}";
          yellow = "#${base0A}";
          blue = "#${base0D}";
          magenta = "#${base0C}";
          cyan = "#${base0D}";
          white = "#${base05}";
        };
      };
    };
  };
}
