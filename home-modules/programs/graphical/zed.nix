{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = [ "make" "nix" ];
    extraPackages = with pkgs; [
      nixd
      gopls
      basedpyright
      
      cascadia-code
    ];
  };
}
