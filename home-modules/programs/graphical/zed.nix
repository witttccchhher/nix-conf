{ pkgs, lib, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = [ "make" "nix" ];
    extraPackages = with pkgs; [
      nixd
      gopls
      basedpyright
    ];

    userSettings = {
      auto_update = false;
      buffer_font_family = lib.mkForce "Cascadia Mono";
      ui_font_family = lib.mkForce "Inter";
    };
  };
}
