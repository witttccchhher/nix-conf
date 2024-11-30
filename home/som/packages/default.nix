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
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];
    packages = with pkgs; [
      # Custom packages

      # Flakes
      inputs.anyrun.packages.${system}.anyrun
      inputs.ani-cli-ru.packages.${system}.ani-cli-ru
      inputs.zen-browser.packages.${system}.generic
      (callPackage ./derivations/ani-cli/ani-cli-ru.nix { })

      # Fonts
      (google-fonts.override { fonts = [ "OpenSans" "Poppins" ]; })

      # Media
      mpv
      grim slurp
      pavucontrol
      eog
      imagemagick

      # Code
      git
      hut
      poetry
      neovim-remote # Utilites neofetch
      fastfetch
      font-manager
      wl-clipboard
      lsd
      nh
      smassh
      # yazi
      yad
      nix-index
      nix-init
      btop
      lazygit
      lutgen
      bat
      duf
      fd
      ripgrep
      file
      fzf
      gping
      typioca
      thokr
      ngrrram
      bun
      upower
      ventoy
      jq
      xdg-user-dirs
      charm-freeze

      # Internet
      chromium
      # telegram-desktop
      paper-plane
      _64gram

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
      dejavu_fonts
      gnome-menus

      # GUI
      waybar
      drawing
      transmission_4-gtk
      zathura
      nautilus
      komikku
      sqlite
      sqlitestudio
      sqlitebrowser
      networkmanagerapplet
      networkmanager-l2tp
      gthumb
      pinta
    ];
  };
}
