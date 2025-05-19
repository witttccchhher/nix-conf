{ ... }: {
  services.xinetd = {
    enable = true;
  };

  services.tftpd.enable = true;
}
