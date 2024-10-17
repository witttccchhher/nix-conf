{ pkgs, inputs, config, ... }: {
  imports = [ inputs.anyrun.homeManagerModules.default ];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
      ];
      x = { fraction = 0.5; };
      y = { fraction = 0.5; };
      width = { fraction = 0.5; };
      showResultsImmediately = true;
      closeOnClick = true;
      hidePluginInfo = true;
      hideIcons = false;
      layer = "overlay";
      maxEntries = null;
    };

    extraCss = with config.lib.stylix.colors; ''
      * {
        all: unset;
        font-family: JetBrainsMono Nerd Font;
        font-size: 15px;
        color: #${base05};
      }

      window {
        background-color: #${base00};
      }

      #match:selected {
        background-color: #${base0C};
      }

      #match:selected #match-title {
        color: #${base00};
      }

      #entry {
        background-color: #${base04};
        padding: 10px;
      }

      box#main {
        background-color: #${base04};
      }
    '';
  };
}
