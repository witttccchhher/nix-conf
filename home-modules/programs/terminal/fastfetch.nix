{ ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "builtin";
        color = { "1" = "magenta"; };
      };
      display = {
        separator = "  ";
        color = "blue";
        key = {
          type = "string";
        };
      };
      modules = [
        "break"
        "break"
        "break"
        "break"
        "break"
        {
          type = "users";
          key = "usr";
          format = "{1}@nixos";
        }
        {
          type = "host";
          key = "hst";
          format = "{2}";
        }
        {
          type = "localip";
          key = "lip";
          format = "{1}";
        }
        {
          type = "os";
          key = "sys";
          format = "{3}";
        }
        {
          type = "kernel";
          key = "ker";
          format = "{2}";
        }
        {
          type = "shell";
          key = "shl";
          format = "{3} on {5}";
        }
        {
          type = "packages";
          key = "pkg";
          format = "{9} & {10} (nix)";
        }
        {
          type = "editor";
          key = "edt";
          format = "witvim {5}";
        }
        {
          type = "wm";
          key = "wms";
          format = "{2}ix by witcher";
        }
      ];
    };
  };
}
