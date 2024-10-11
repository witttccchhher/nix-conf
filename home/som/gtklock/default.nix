{
  xdg.configFile = {
    "gtklock/config.ini".text = ''
      [main]
      style = ${/home/som/.config/gtklock/style.css}
    '';
    "gtklock/style.css".text = ''
      * {
        font-family: scientifica;
        border-radius: 0;
      }

      #clock-label {
        font-size: 100px;
      }

      #input-label,
      #error-label,
      button,
      #window-box {
        font-size: 20px;
        font-weight: normal;
      }
    '';
  };
}
