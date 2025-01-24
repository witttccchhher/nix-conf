{ config, ... }: {
  xdg.configFile = {
    "gtklock/style.css".text = ''
      * {
        font-family: Inter;
      }

      window {
        background-image: url("${config.stylix.image}");
      }
    '';
    "gtklock/config.ini".text = ''
      [main]
      style = ${config.home.homeDirectory}/.config/gtklock/style.css
    '';
  };
}
