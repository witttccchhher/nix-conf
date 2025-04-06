{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;
    extensions = [ "make" "nix" ];
    extraPackages = with pkgs; [
      nixd
      gopls
      basedpyright
    ];

    userSettings = {
      buffer_font_family = "${pkgs.cascadia-code}/share/fonts/truetype/CascadiaMono-Regular.ttf";
    };
  };
}
