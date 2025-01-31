{ pkgs, pkgs-master, inputs, ... }: {
  imports = [ ./overlays.nix ];


  home = {
    sessionVariables = {
      EDITOR = "nvim";
      QT_WAYLAND_DECORATION = "adwaita";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      NIXPKGS_ALLOW_INSECURE = 1;
      COLORTERM = "truecolor";
      FLAKE = "/home/som/nix";
      GOPATH = "$HOME/go";
      MESA_GL_VERSION_OVERRIDE = "3.3";
      MESA_GLSL_VERSION_OVERRIDE = "330";
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
      "$GOPATH/bin"
    ];
    packages = with pkgs; [
      # Flakes
      inputs.zen-browser.packages.${system}.default
      (callPackage ./derivations/ani-cli/ani-cli-ru.nix { })

      # Fonts
      (google-fonts.override { fonts = [ "Inter" ]; })
      dejavu_fonts
      commit-mono

      # Media
      mpv
      grim slurp
      pavucontrol
      eog
      imagemagick
      mpd
      mpc

      # Code
      git
      go
      poetry
      neovim-remote
      
      # Utilites
      fastfetch
      wl-clipboard
      wirelesstools
      killall
      lsd
      tree
      nh
      gum
      nix-init
      btop
      lazygit
      tgpt
      lutgen
      bat
      openvpn
      duf
      fd
      gh
      skate
      ripgrep
      file
      fzf
      gperf
      cmake
      pkg-config
      libwebp
      gping
      bun
      upower
      jq
      gopass
      xdg-user-dirs
      ascii-image-converter

      # Internet
      qutebrowser
      wireguard-tools
      amneziawg-go
      amneziawg-tools
      ayugram-desktop

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
      swayimg
      obsidian
      nwg-drawer
      font-manager
      blueman
    ];
  };
}
