{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us,ru";
        options = "grp:caps_toggle";
      };
      windowManager.awesome = {
        enable = true;
      };
    };
    displayManager.ly = {
      enable = true;
    };
  };
}
