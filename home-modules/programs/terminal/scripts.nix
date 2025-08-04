{ pkgs, lib, ... }:
let
  nx =
    pkgs.writeShellScriptBin "nx" # bash
      ''
        action=$(${lib.getExe pkgs.gum} choose "Rebuild os" "Rebuild home" "Update flake")

        case "$action" in
          "Rebuild os")
            cd ~/nix || exit
            ${lib.getExe pkgs.git} add --all
            ${lib.getExe pkgs.git} commit -m "Autocommit by NX"
            cd ~ || exit
            sudo ${lib.getExe pkgs.nixos-rebuild} switch --flake path:nix
            ;;
          "Rebuild home")
            cd ~/nix || exit
            ${lib.getExe pkgs.git} add --all
            ${lib.getExe pkgs.git} commit -m "Autocommit by NX"
            cd ~ || exit
            ${lib.getExe pkgs.home-manager} switch --flake path:nix
            ;;
          "Update flake")
            cd ~ || exit
            sudo nix flake update --flake path:nix
            ;;
        esac
      '';

  yp =
    pkgs.writeShellScriptBin "yp" # bash
      ''
        cat ~/.password | ${lib.getExe' pkgs.wl-clipboard "wl-copy"}
      '';

  vpn =
    pkgs.writeShellScriptBin "vpn" # bash
      ''
        INTERFACE="WARP"

        status=$(systemctl is-active wg-quick-$INTERFACE.service)
        if [[ $status == "inactive" ]]; then
          echo "Starting VPN ($INTERFACE)..."
          systemctl start wg-quick-$INTERFACE.service
        else
          echo "Turning VPN off ($INTERFACE)..."
          systemctl stop wg-quick-$INTERFACE.service
        fi
      '';
in
{
  home.packages = [
    nx
    yp
    vpn
  ];
}
