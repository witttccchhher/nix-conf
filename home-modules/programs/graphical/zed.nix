{ pkgs, lib, ... }: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = [ "make" "nix" ];
    extraPackages = with pkgs; [
      nixd
      gopls
      basedpyright
    ];
  };
}
