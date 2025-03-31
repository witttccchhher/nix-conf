{ ... }: {
  containers = {
    wireguardForTerraria = {
      autoStart = true;
      privateNetwork = true;
      hostAddress = "192.168.100.10";
      localAddress = "192.168.100.11";

      config = { pkgs, lib, ... }: {
        environment.systemPackages = with pkgs; [
          neovim
          wireguard-go
          wireguard-tools
        ];

        system.stateVersion = "25.05";

        networking = {
          wireless.enable = true;
          firewall = {
            enable = true;
            allowedTCPPorts = [ 80 ];
            allowedUDPPorts = [ 51820 ];
          };
          useHostResolvConf = lib.mkForce false;
        };
        services.resolved.enable = true;
      };
    };
  };
}
