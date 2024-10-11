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
      inputs.ignis.packages.${system}.ignis
      inputs.ani-cli-ru.packages.${system}.ani-cli-ru
      inputs.gocheat.packages.${system}.gocheat
      inputs.yetris.packages.${system}.yetris

      # Fonts
      (google-fonts.override { fonts = [ "OpenSans" ]; })

      # Media
      mpv
      grim slurp
      pavucontrol
      eog

      # Code
      micro helix
      git

      # Utilites
      neofetch
      fastfetch
      font-manager
      wl-clipboard
      lsd
      nh
      smassh
      yazi
      yad
      nix-index
      btop
      lazygit
      lutgen
      bat
      duf
      fd
      ripgrep
      fzf
      gping

      # Internet
      ungoogled-chromium
      firefox
      telegram-desktop
      materialgram
      fractal
      revolt-desktop

      # Other
      adwaita-qt
      adwaita-qt6
      qadwaitadecorations
      qadwaitadecorations-qt6
      qt5ct
      qt6ct

      # GUI
      waybar
      drawing
      transmission_4-gtk
      zathura
      nautilus
    ];
  };
}
