{ pkgs, lib, ... }: let
  nx = pkgs.writeShellScriptBin "nx" /* bash */ ''
    action=$(${lib.getExe pkgs.gum} choose "  Rebuild os" "  Rebuild home" "󰜗  Update flake" "  Search package" "󰘳  Open REPL" "  Clean garbage")

    case "$action" in
      "  Rebuild os")
        cd ~/nix || exit
        ${lib.getExe pkgs.git} add --all
        ${lib.getExe pkgs.git} commit -m "Autocommit by NX"
        cd ~ || exit
        ${lib.getExe pkgs.nh} os switch
        ${lib.getExe' pkgs.libnotify "notify-send"} -a "NX" "Completed" "System configuration has been successfully updated"
        ;;
      "  Rebuild home")
        cd ~/nix || exit
        ${lib.getExe pkgs.git} add --all
        ${lib.getExe pkgs.git} commit -m "Autocommit by NX"
        cd ~ || exit
        ${lib.getExe pkgs.nh} home switch
        ${lib.getExe' pkgs.libnotify "notify-send"} -a "NX" "Completed" "Home manager has been successfully updated"
        ;;
      "󰜗  Update flake")
        nix flake update --flake "path:/home/witcher/nix/"
        ${lib.getExe' pkgs.libnotify "notify-send"} -a "NX" "Completed" "Flake updated successfully. You can update your system"
        ;;
      "  Search package")
        package=$(${lib.getExe pkgs.gum} input --placeholder="  Type package name...")
        ${lib.getExe pkgs.nh} search -c nixos-unstable -l 7 "$package"
        ;;
      "󰘳  Open REPL")
        ${lib.getExe pkgs.nh} os repl
        ;;
      "  Clean garbage")
        ${lib.getExe pkgs.gum} confirm "  Do you want to clean garbage?" && ${lib.getExe pkgs.nh} clean all
        ${lib.getExe' pkgs.libnotify "notify-send"} -a "NX" "Completed" "The system has been successfully cleaned of fucking garbage"
        ;;
    esac
  '';

  yp = pkgs.writeShellScriptBin "yp" /* bash */ ''
    cat ~/.password | ${lib.getExe' pkgs.wl-clipboard "wl-copy"}
  '';
in {
  home.packages = [
    nx
    yp
  ];
}
