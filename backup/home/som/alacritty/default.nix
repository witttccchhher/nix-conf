{ config, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        live_config_reload = true;
      };
      window = {
        dimensions = { columns = 70; lines = 25; };
        padding = { x = 7; y = 7; };
        decorations = "None";
      };
      font = {
        normal = { family = "CaskaydiaMono Nerd Font"; style = "Regular"; };
        bold = { family = "CaskaydiaMono Nerd Font"; style = "Bold"; };
        italic = { family = "CaskaydiaMono Nerd Font"; style = "Italic"; };
        size = 12;
      };
      cursor = {
        style = { shape = "Block"; blinking = "Off"; };
        vi_mode_style = { shape = "Block"; blinking = "Off"; };
        blink_interval = 800;
        blink_timeout = 0;
        unfocused_hollow = false;
      };
      colors = with config.lib.stylix.colors; {
        primary = {
          foreground = "#${base07}";
          background = "#${base00}";
        };
        cursor = { text = "CellBackground"; cursor = "CellForeground"; };
        vi_mode_cursor = { text = "CellBackground"; cursor = "CellForeground"; };
        selection = { text = "CellBackground"; background = "CellForeground"; };
        normal = {
          black = "#${base00}";
          red = "#${base08}";
          green = "#${base0B}";
          yellow = "#${base09}";
          blue = "#${base0C}";
          magenta = "#${base0D}";
          cyan = "#${base0E}";
          white = "#${base07}";
        };
      };
    };
  };
}
