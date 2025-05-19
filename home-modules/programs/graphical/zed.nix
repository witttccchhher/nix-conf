{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "make"
      "material-icon-theme"
      "dockerfile"
      "docker-compose"
      "sql"
      "csv"
      "env"
      "nginx"
      "nix"
      "basedpyright"
      "html"
      "scss"
      "git-firefly"
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
      features = {
        edit_prediction_provider = "none";
      };
      icon_theme = {
        mode = "system";
        light = "Material Icon Theme";
        dark = "Material Icon Theme";
      };
      hover_popover_enabled = false;

      buffer_font_family = lib.mkForce "CommitMono";
      buffer_font_features = {
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
      buffer_font_size = lib.mkForce 16;

      tab_bar = {
        show_nav_history_buttons = false;
      };
      tabs = {
        file_icons = true;
        git_status = true;
      };

      enable_language_server = true;
      lsp = {
        basedpyright.settings = {
          basedpyright.analysis = {
            typeCheckingMode = "basic";
            autoSearchPaths = true;
            logLevel = "Warning";
            autoImportCompletions = false;
            diagnosticMode = "workspace";
            useLibraryCodeForTypes = true;
            diagnosticSeverityOverrides = {
              reportUnusedClass = false;
              reportUnusedFunction = false;
              reportUnusedVariable = false;
              reportUnusedCallResult = false;
              reportUnusedCoroutine = false;
              reportUnusedExcept = false;
              reportUnusedExpression = false;
              reportUnusedParameter = false;
            };
          };
        };
        nixd.settings = {
          nixpkgs.expr = "import <nixpkgs> { }";
          options = {
            nixos.expr = "(builtins.getFlake \"/home/witcher/nix\").nixosConfigurations.ms7996.options";
            home-manager.expr = "(builtins.getFlake \"/home/witcher/nix\").homeConfigurations.witcher.options";
          };
        };
      };

      diagnostics = {
        inline.enabled = true;
      };

      inlay_hints.enabled = true;

      languages = {
        Python = {
          language_servers = [
            "basedpyright"
            "!pyright"
            "!pylsp"
          ];
        };
        Nix = {
          language_servers = [
            "nixd"
            "nil"
          ];
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
    userKeymaps = [
      {
        bindings = {
          alt-t = "task::Spawn";
          alt-w = "pane::CloseActiveItem";
        };
      }
    ];
  };
}
