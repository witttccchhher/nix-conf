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
      amberol

      # Code
      git
      go
      poetry
      neovim-remote
      neovide
      vscode
      nixd
      
      # Utilites
      fastfetch
      dwt1-shell-color-scripts
      wl-clipboard
      wirelesstools
      glow
      swaybg
      killall
      tdlib
      lsd
      go-mtpfs
      xclip
      xsel
      tree
      croc
      nh
      wlr-randr
      gum
      smassh
      # chess-tui-1_6_0
      stockfish
      flameshot
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
      gh
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
      gopass
      swww
      xdg-user-dirs

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
      gitbutler
      zathura
      nautilus
      sqlite
      aseprite
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
      google-chrome
    ];
  };
}
