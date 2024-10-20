{ pkgs, ... }: {
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-gtk3;
  };
}
