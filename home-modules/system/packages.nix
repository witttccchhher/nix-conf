{
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.nix-index-database.hmModules.nix-index
  ];

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      QT_WAYLAND_DECORATION = "adwaita";
      QT_QPA_PLATFORMTHEME = lib.mkForce "gtk3";
      COLORTERM = "truecolor";
      NH_FLAKE = "/home/witcher/nix";
      NIXOS_OZONE_WL = 1;
      QT_QPA_PLATFORM = "wayland";
      GDK_BACKEND = "wayland";
      XDG_SESSION_TYPE = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
    packages = with pkgs; [
      # Flakes
      inputs.zen-browser.packages.${system}.default
      inputs.witpkgs.packages.${system}.anicli-ru
      inputs.elyprism.packages.${system}.default

      # Media
      mpv
      pavucontrol
      eog
      imagemagick
      wf-recorder
      silicon
      zathura
      drawing
      pinta

      # Fonts
      commit-mono
      dejavu_fonts
      (google-fonts.override { fonts = [ "Inter" ]; })
      font-manager

      # Terminal utilities
      pfetch
      btop
      lazygit
      bat
      duf
      fd
      ripgrep
      fzf
      gping
      killall
      gum
      libnotify

      # System utilities
      wl-clipboard
      ventoy
      wirelesstools
      upower
      jq
      xdg-user-dirs
      pinentry
      file
      nh
      localsearch
      lla
      nixfmt-rfc-style
      blueman
      bluetuith
      lutris
      networkmanager-l2tp
      transmission_4-gtk
      nautilus
      nix-your-shell

      # Development
      git
      go
      python314Full
      lua
      uv
      gperf
      cmake
      pkg-config
      libwebp
      python313Packages.requests
      nodejs
      pnpm
      yarn
      bun
      sqlite
      sqlitestudio
      sqlitebrowser
      docker
      docker-compose

      # GUI
      gtk4
      gtk3
      adwaita-qt
      adwaita-qt6
      qadwaitadecorations
      qadwaitadecorations-qt6
      libsForQt5.qt5ct
      kdePackages.qt6ct
      hicolor-icon-theme

      # Messengers
      telegram-desktop
      vesktop
      element-desktop

      # VPN & Security
      wireguard-tools
      amneziawg-go
      amneziawg-tools
      xray

      # Terminals
      foot
      kitty

      # Misc
      nix-init
      lutgen
      gh
      obsidian
      keypunch
      zenity
    ];
  };
}
