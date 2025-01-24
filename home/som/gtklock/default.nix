{ config, ... }: {
  xdg.configFile = {
    "gtklock/style.css".text = /* css */ ''
      * {
        font-family: Inter;
        color: ${config.stylix.lib.colors.withHashtag.base00};
      }

      window {
        background-image: url("${config.stylix.image}");
      }

      #window-box {
        margin-bottom: 650px;
        background-color: ${config.stylix.lib.colors.withHashtag.base05};
        border-radius: 15px;
        padding: 10px 30px;
      }

      #clock-label {
        font-weight: 600;
      }

      #window-box entry {
        background-color: ${config.stylix.lib.colors.withHashtag.base04};
        color: ${config.stylix.lib.colors.withHashtag.base05};
        border: none;
        box-shadow: none;
      }

      #window-box button {
        background-color: ${config.stylix.lib.colors.withHashtag.base04};
        color: ${config.stylix.lib.colors.withHashtag.base05};
        border: none;                                                              
        box-shadow: none;
      }
    '';
    "gtklock/config.ini".text = /* ini */ ''
      [main]
      style = ${config.home.homeDirectory}/.config/gtklock/style.css
    '';
  };
}
