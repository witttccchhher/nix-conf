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
    };
    sessionPath = [
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
      "$GOPATH/bin"
      "$HOME/.config/emacs/bin"
    ];
    packages = with pkgs; [
      # Flakes
      inputs.zen-browser.packages.${system}.generic
      inputs.toru.defaultPackage.${system}
      (callPackage ./derivations/ani-cli/ani-cli-ru.nix { })
      (callPackage ./derivations/curd/curd.nix { })

      # Fonts
      (google-fonts.override { fonts = [ "Poppins" "Inter" ]; })

      # Media
      mpv
      grim slurp
      pavucontrol
      eog
      imagemagick

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
      wl-clipboard
      wirelesstools
      killall
      lsd
      tree
      nh
      smassh
      nix-index
      nix-init
      btop
      lazygit
      lutgen
      bat
      duf
      fd
      tg
      skate
      ripgrep
      file
      fzf
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
    ];
  };
}
