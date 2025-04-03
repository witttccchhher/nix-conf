{ pkgs, inputs, ... }: {
  imports = [
    inputs.nix-index-database.hmModules.nix-index
  ];

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      QT_WAYLAND_DECORATION = "adwaita";
      QT_QPA_PLATFORMTHEME = "gtk3";
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
      inputs.tgt.packages.${system}.default

      # Fonts
      (google-fonts.override { fonts = [ "Inter" ]; })
      dejavu_fonts
      cascadia-code

      # Media
      mpv
      grim slurp
      pavucontrol
      eog
      imagemagick
      mpd
      mpc
      spotify

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
      swaybg
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
      bun
      upower
      jq
      xdg-user-dirs
      pass
      pinentry
      silicon
      wf-recorder
      hyprshot

      # Internet
      python313Packages.requests
      wireguard-tools
      amneziawg-go
      amneziawg-tools
      ayugram-desktop
      vesktop
      zoom-us

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
      gtklock
      kitty
      nekoray
      waybar
      drawing
      transmission_4-gtk
      zathura
      nautilus
      sqlite
      sqlitestudio
      sqlitebrowser
      networkmanagerapplet
      networkmanager-l2tp
      pinta
      swayimg
      obsidian
      nwg-drawer
      font-manager
      blueman
      lutris
      nuclear
      memos
      youtube-music
    ];
  };
}
