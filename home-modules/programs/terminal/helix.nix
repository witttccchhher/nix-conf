{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nixd
      gopls
      ty
      bash-language-server

      nixfmt-rfc-style
    ];
  };
}
