{ pkgs, inputs, config, ... }: {
  imports = [ inputs.anyrun.homeManagerModules.default ];

  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
      ];
      x = { absolute = 960; };
      y = { absolute = 540; };
      width = { absolute = 800; };
      height = { absolute = 500; };
      showResultsImmediately = true;
      closeOnClick = false;
      hidePluginInfo = true;
      hideIcons = true;
      layer = "top";
      maxEntries = null;
    };

    extraCss = with config.lib.stylix.colors; ''
      * {
        all: unset;
        font-family: Inter;
        font-size: 16px;
        font-weight: 500;
        color: #${base06};
      }

      window {
        background-color: #${base01};
      }

      #match:selected {
        background-color: #${base0B};
      }

      #match:selected #match-title {
        color: #${base00};
      }

      #entry {
        background-color: #${base02};
        padding: 10px;
      }

      box#main {
        background-color: #${base02};
      }
    '';
  };
}
