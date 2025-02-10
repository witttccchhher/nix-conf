{ lib, pkgs, config, ... }: {
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    settings = {
      manager = {
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_dir_first = true;
        show_hidden = true;
      };

      preview = {
        image_filter = "nearest";
        image_quality = 50;
        sixel_fraction = 20;
        wrap = "no";
      };

      opener = {
        edit = [ { run = "nvim $0"; block = true; } ];
        open = [ { run = "xdg-open $0"; block = true; } ];
      };
    };
    theme = with config.lib.stylix.colors; {
      manager = {
      #   cwd = { fg = "#${base0E}"; bg = "reset"; bold = true; };
      #
      #   hovered = { fg = "#${base00}"; bg = "#${base0E}"; bold = true; };
      #   preview_hovered = { fg = "#${base0E}"; bg = "reset"; };
      #
      #   find_keyword = { fg = "#${base04}"; underline = true; bold = true; };
      #
      #   tab_active = { fg = "#${base00}"; bg = "#${base0E}"; };
      #   tab_inactive = { fg = "#${base00}"; bg = "#${base04}"; };
      #
        border_style = { fg = lib.mkForce "#${base00}"; };
      };
      #
      status = {
        separator_open = lib.mkForce " ";
        separator_close = lib.mkForce " ";
      #
      #   mode_normal = { fg = "#${base00}"; bg = "#${base0E}"; bold = true; };
      #   mode_select = { fg = "#${base00}"; bg = "#${base0A}"; bold = true; };
      #   mode_unset = { fg = "#${base00}"; bg = "#${base09}"; bold = true; };
      #
      #   Progress_label = { fg = "#${base00}"; bg = "#${base0E}"; bold = true; };
      #   Progress_normal = { fg = "#${base00}"; bg = "#${base0E}"; bold = true; };
      #   Progress_error = { fg = "#${base00}"; bg = "#${base08}"; bold = true; };
      };

      filetype = {
        rules = [
          { mime = "*"; is = "exec"; fg = "#${base0E}"; }
          { mime = "*"; fg = "#${base05}"; }
        ];
      };
    };
  };
}
