{ config, ... }:
{
  imports = [ ../../custom/lla.nix ];

  programs.lla = {
    enable = true;
    settings = {
      default_sort = "name";
      default_format = "grid";
      show_icons = true;
      include_dirs = false;
      permission_format = "symbolic";
      theme = "oldworld";
      enabled_plugins = [ ];
      plugins_dir = "~/.config/lla/plugins";
      default_depth = 2;

      sort = {
        dirs_first = true;
        case_sensitive = false;
        natural = true;
      };

      filter = {
        case_sensitive = false;
        no_dotfiles = false;
      };

      formatters.tree = {
        max_lines = 20000;
      };

      formatters.grid = {
        ignore_width = false;
        max_width = 200;
      };

      listers.recursive = {
        max_entries = 20000;
      };

      listers.fuzzy = {
        ignore_patterns = [
          "node_modules"
          "target"
          ".git"
          ".idea"
          ".vscode"
        ];
      };
    };

    theme = with config.lib.stylix.colors.withHashtag; {
      name = "${config.programs.lla.settings.theme}";
      author = "dgox16";
      description = "...";

      colors = {
        file = "${base07}";
        directory = "${base09}";
        symlink = "${base0A}";
        executable = "${base0B}";
      };

      special_files = {
        folders = {
          ".git" = "${base08}";
        };

        dotfiles = {
          ".gitignore" = "${base08}";
        };

        exact_match = {
          "flake.nix" = "${base0C}";
          "shell.nix" = "${base0C}";
        };
      };
    };
  };
}
