{ pkgs, lib, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = [ "make" "nix" ];
    extraPackages = with pkgs; [
      nixd
      nil
      gopls
      basedpyright

      direnv

      nixfmt-rfc-style
    ];

    userSettings = {
      autosave.after_delay.milliseconds = 60000;
      restore_on_startup = "last_session";
      auto_update = false;

      buffer_font_family = lib.mkForce "Cascadia Mono";
      buffer_font_features = {
        calt = true;
        ss01 = true;
        ss19 = true;
        ss20 = true;
      };
      buffer_font_size = lib.mkForce 16;

      tab_bar = {
        show_nav_history_buttons = false;
      };
      tabs = {
        file_icons = true;
        git_status = true;
      };

      enable_language_server = true;
      lsp.nixd.settings = {
        nixpkgs.expr = "import <nixpkgs> { }";
        options = {
          nixos.expr = "(builtins.getFlake \"/home/witcher/nix\").nixosConfigurations.ms7996.options";
          home-manager.expr = "(builtins.getFlake \"/home/witcher/nix\").homeConfigurations.witcher.options";
        };
      };

      diagnostics = {
        inline.enabled = true;
      };

      inlay_hints.enabled = true;

      languages = {
        Nix = {
          formatter.external = {
            command = "nixfmt";
            arguments = [ "--quiet" "--" ];
          };
        };
      };
      ui_font_family = lib.mkForce "Inter";
    };
  };
}
