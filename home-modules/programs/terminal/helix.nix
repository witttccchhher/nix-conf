{ pkgs, inputs, ... }: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
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
