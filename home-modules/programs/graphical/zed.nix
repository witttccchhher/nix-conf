{ pkgs, ... }: {
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
      buffer_font_family = "Cascadia Mono";
      ui_font_family = "Cascadia Mono";
    };
  };
}
