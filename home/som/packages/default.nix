{ pkgs, inputs, ... }: {
  imports = [ ./overlays.nix ];


  home = {
    sessionVariables = {
      EDITOR = "nvim";
      QT_WAYLAND_DECORATION = "adwaita";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      NIXPKGS_ALLOW_INSECURE = 1;
      COLORTERM = "truecolor";
      MICRO_TRUECOLOR = 1;
      FLAKE = "/home/som/nix";
      GOPATH = "$HOME/go";
      LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
        stdenv.cc.cc.lib
        xorg.libxcb
        xorg.libX11
        xorg.libXext
        xorg.libXrandr
        xorg.libXcomposite
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXfixes
        xorg.libXi
        xorg.libXrender
        gtk3
        pango
        cairo
        at-spi2-atk
        gobject-introspection
        gdk-pixbuf
        glib
        alsa-lib
        freetype
        fontconfig
        dbus
      ];
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
      "$GOPATH/bin"
      "$HOME/.config/emacs/bin"
    ];
    packages = with pkgs; [
      # Flakes
      inputs.zen-browser.packages.${system}.default
      inputs.astal.packages.${system}.astal3
      (callPackage ./derivations/ani-cli/ani-cli-ru.nix { })
      (callPackage ./derivations/curd/curd.nix { })

      # Fonts
      (google-fonts.override { fonts = [ "Poppins" "Inter" "Roboto Mono" ]; })
      dejavu_fonts

      # Media
      mpv
      grim slurp
      pavucontrol
      eog
      imagemagick

      # Playwright
      playwright
      

      # Code
      git
      go
      hut
      poetry
      neovim-remote
      emacs
      
      # Utilites
      fastfetch
      dwt1-shell-color-scripts
      carbon-now-cli
      wl-clipboard
      wirelesstools
      glow
      killall
      tdlib
      lsd
      xclip
      xsel
      tree
      nh
      smassh
      picom-pijulius
      flameshot
      nix-index
      nix-init
      btop
      lazygit
      tgpt
      tofi
      lutgen
      bat
      openvpn
      duf
      fd
      tg
      skate
      ripgrep
      file
      fzf
      gperf
      cmake
      pkg-config
      libappindicator
      libwebp
      gping
      bun
      upower
      jq
      xdg-user-dirs

      # Internet
      qutebrowser
      _64gram
      wireguard-tools
      amneziawg-go
      amneziawg-tools

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
      obsidian
      nwg-drawer
      font-manager
      blueman
    ];
  };
}
