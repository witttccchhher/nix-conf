{ pkgs, inputs, lib, ... }: {
  imports = [ inputs.nix-index-database.hmModules.nix-index
  ];

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      QT_WAYLAND_DECORATION = "adwaita";
      QT_QPA_PLATFORMTHEME = lib.mkForce "gtk3";
      COLORTERM = "truecolor";
      FLAKE = "/home/witcher/nix";
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

      # Code
      git
      go
      lua
      uv
      
      # Utilites
      fastfetch
      wl-clipboard
      wirelesstools
      killall
      localsearch
      lla
      nh
      gum
      nix-init
      btop
      lazygit
      lutgen
      bat
      duf
      fd
      gh
      ripgrep
      file
      fzf
      bluetuith
      gperf
      cmake
      pkg-config
      libwebp
      gping
      upower
      jq
      xdg-user-dirs
      pinentry
      silicon

      # Internet
      python313Packages.requests
      wireguard-tools
      amneziawg-go
      amneziawg-tools
      ayugram-desktop
      vesktop

      # Other
      gtk4
      gtk3
      adwaita-qt
      adwaita-qt6
      qadwaitadecorations
      qadwaitadecorations-qt6
      libsForQt5.qt5ct
      kdePackages.qt6ct
      hicolor-icon-theme

      # GUI
      foot
      kitty
      nekoray
      drawing
      transmission_4-gtk
      zathura
      nautilus
      sqlite
      sqlitestudio
      sqlitebrowser
      networkmanager-l2tp
      pinta
      obsidian
      font-manager
      blueman
      lutris
      gnome-tweaks
      dconf-editor
    ];
  };
}
