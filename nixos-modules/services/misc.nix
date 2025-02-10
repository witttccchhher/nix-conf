{ ... }: {
  services = {
    resolved.enable = true;
    openssh.enable = true;
    printing.enable = false;
    upower.enable = true;
    libinput.enable = true;
    pptpd.enable = false;
  };
}
