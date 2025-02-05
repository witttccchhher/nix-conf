{
  import = [ ../custom-modules/lla ];

  programs.lla = {
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
}
