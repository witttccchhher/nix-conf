{ pkgs, lib, ... }: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;
    extensions = [ "make" "nix" ];
    extraPackages = with pkgs; [
      nixd
      gopls
      basedpyright

      cascadia-code
    ];

    userSettings = {
      buffer_font_family = lib.mkForce "Cascadia Mono NF";
    };
  };
}
