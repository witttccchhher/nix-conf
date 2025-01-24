{ config, ... }: {
  xdg.configFile = {
    "gtklock/style.css".text = ''
      * {
        font-family: Inter;
      }
    '';
    "gtklock/config.ini".text = ''
      [main]
      style = ${config.home.homeDirectory}/.config/gtklock/style.css
    '';
  };
}
