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
      # inputs.ani-cli-ru.packages.${system}.ani-cli-ru
      # inputs.gocheat.packages.${system}.gocheat
      # inputs.yetris.packages.${system}.yetris
      # inputs.ytui.packages.${system}.ytui
      # inputs.canvas.packages.${system}.canvas
      # inputs.fabric-python.packages.${system}.default
      inputs.zen-browser.packages.${system}.generic
      inputs.llwit.packages.${system}.default

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
      neovim-remote

      # Utilites
      neofetch
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
      telegram-desktop
      affine

      # Other
      gtk4
      adwaita-qt
      adwaita-qt6
      qadwaitadecorations
      qadwaitadecorations-qt6
      libsForQt5.qt5ct
      kdePackages.qt6ct

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
    ];
  };
}
