{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "make"
      "nix"
      "material-icon-theme"
    ];
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
      icon_theme = {
        mode = "system";
        light = "Material Icon Theme";
        dark = "Material Icon Theme";
      };
      hover_popover_enabled = false;

      buffer_font_family = lib.mkForce "CommitMono";
      buffer_font_features = {
        calt = 1;
        ss01 = 1;
        ss02 = 1;
        ss03 = 1;
        ss04 = 1;
        ss05 = 1;
        cv01 = 1;
        cv02 = 1;
        cv03 = 1;
        cv04 = 1;
        cv05 = 1;
        cv06 = 1;
        cv07 = 1;
        cv08 = 1;
        cv09 = 1;
        cv10 = 1;
        cv11 = 1;
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
            arguments = [
              "--quiet"
              "--"
            ];
          };
        };
      };

      completions = {
        words = "disabled";
        lsp_insert_mode = "replace";
      };

      soft_wrap = "editor_width";

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      terminal = {
        font_family = lib.mkForce "CommitMono";
        font_size = lib.mkForce 14;
        font_features = {
          calt = true;
          ss01 = true;
          ss02 = true;
          ss03 = true;
          ss04 = true;
          ss05 = true;
          cv01 = true;
          cv02 = true;
          cv03 = true;
          cv04 = true;
          cv05 = true;
          cv06 = true;
          cv07 = true;
          cv08 = true;
          cv09 = true;
          cv10 = true;
          cv11 = true;
        };
      };

      vim_mode = false;

      assistant.enabled = false;

      ui_font_family = lib.mkForce "Inter";
      ui_font_size = lib.mkForce 16;
    };
  };
}
