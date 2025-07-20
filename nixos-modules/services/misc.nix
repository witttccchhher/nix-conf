{ ... }:
{
  services = {
    resolved.enable = true;
    openssh.enable = true;
    printing.enable = true;
    upower.enable = true;
    libinput.enable = true;
    pptpd.enable = false;
    fstrim.enable = true;
  };
}
