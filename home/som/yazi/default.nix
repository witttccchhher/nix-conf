{ pkgs, config, ... }: {
  programs.yazi = {
    enable = true;
    # package = pkgs.callPackage ./yazi.nix { };
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
    keymap = {
      manager = {
        prepend_keymap = [
          {
            desc = "Go to nix/";
            on = [ "g" "n" ];
            run = "cd ~/nix";
          }
        ];
      };
    };
    theme = with config.lib.stylix.colors; {
      manager = {
        cwd = { fg = "#${base0C}"; bg = "reset"; bold = true; };

        hovered = { fg = "#${base00}"; bg = "#${base0E}"; bold = true; };
        preview_hovered = { fg = "#${base0D}"; bg = "reset"; };

        find_keyword = { fg = "#${base00}"; underline = true; bold = true; };

        tab_active = { fg = "#${base00}"; bg = "#${base0C}"; };
        tab_inactive = { fg = "#${base00}"; bg = "#${base04}"; };

        border_style = { fg = "#${base00}"; };
      };

      status = {
        separator_open = " ";
        separator_close = " ";

        mode_normal = { fg = "#${base00}"; bg = "#${base0C}"; bold = true; };
        mode_select = { fg = "#${base00}"; bg = "#${base0A}"; bold = true; };
        mode_unset = { fg = "#${base00}"; bg = "#${base09}"; bold = true; };

        Progress_label = { fg = "#${base00}"; bg = "#${base0C}"; bold = true; };
        Progress_normal = { fg = "#${base00}"; bg = "#${base0C}"; bold = true; };
        Progress_error = { fg = "#${base00}"; bg = "#${base08}"; bold = true; };
      };

      filetype = {
        rules = [
          { mime = "*"; is = "exec"; fg = "#${base0D}"; }
          { mime = "*"; fg = "#${base07}"; }
        ];
      };
    };
  };
}
