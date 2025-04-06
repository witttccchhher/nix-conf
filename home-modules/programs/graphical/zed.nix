{ pkgs, lib, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = [ "make" "nix" ];
    extraPackages = with pkgs; [
      nixd
      gopls
      basedpyright

      direnv
    ];

    userSettings = {
      autosave.after_delay.milliseconds = 60000;
      restore_on_startup = "last_session";
      auto_update = false;

      buffer_font_family = lib.mkForce "Cascadia Mono";
      buffer_font_features = {
        calt = true;
        ss01 = true;
        ss19 = true;
        ss20 = true;
      };
      buffer_font_size = 16;

      tab_bar = {
        show_nav_history_buttons = false;
      };
      ui_font_family = lib.mkForce "Inter";
    };
  };
}
