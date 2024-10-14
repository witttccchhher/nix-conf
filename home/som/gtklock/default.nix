{
  xdg.configFile = {
    "gtklock/style.css".text = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        border-radius: 2;
      }

      #clock-label {
        font-size: 50px;
      }

      #input-label,
      #error-label,
      button,
      #window-box {
        font-size: 14px;
        font-weight: normal;
      }
    '';
    "gtklock/config.ini".text = ''
      [main]
      style = ${/home/som/.config/gtklock/style.css}
    '';
  };
}
