{ ... }: {
  containers = {
    wireguard_for_terraria = {
      autoStart = true;
      privateNetwork = true;
      hostAddress = "192.168.100.10";
      localAddress = "192.168.100.11";

      config = { pkgs, lib, ... }: {
        environment.systemPackages = with pkgs; [ neovim wireguard-go wiregard-tools ];

        system.stateVersion = "25.05";

        networking = {
          firewall = {
            enable = true;
            allowedTCPPorts = [ 80 ];
          };
          useHostResolvConf = lib.mkForce false;
        };
        services.resolved.enable = true;
      };
    };
  };
}
