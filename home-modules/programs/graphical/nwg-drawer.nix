{ config, ... }: {
  xdg.configFile."nwg-drawer/drawer.css".text = with config.lib.stylix.colors.withHashtag; /* css */ ''
    * {
      font-family: Inter;
      font-size: 16px;
      font-weight: 500;
    }

    window {
      background-color: ${base00};
      color: ${base07};
    }

    entry {
      background-color: ${base03};
    }

    button, image {
      background: none;
      border: none;
    }

    button:hover {
      background-color: ${base03};
    }

    #pinned-box {
      padding-bottom: 5px;
      border-bottom: 2px solid ${base0F};
    }

    #files-box {
      padding: 5px;
      border: 2px solid ${base0F};
      border-radius: 15px;
    }

    #math-label {
      color: ${base07};
      font-weight: bold;
      font-size: 16px;
    }
  '';
}
