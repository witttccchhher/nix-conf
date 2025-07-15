{ pkgs, ... }: {
  programs.lf = {
    enable = true;

    settings = {
      anchorfind = false;
      globsearch = true;
      hidden = true;
      scrolloff = 5;
      sixel = true;
      tabstop = 2;
    };

    previewer = {
      source = pkgs.writeShellScript "lf-preview.sh" ''
        #!/bin/sh

        case "$1" in
          *.tar*) tar tf "$1";;
          *.zip) unzip -l "$1";;
          *.rar) unrar l "$1";;
          *.7z) 7z l "$1";;
          *.pdf) pdftotext "$1" -;;
          *) highlight -O ansi "$1" || cat "$1";;
        esac
      '';
    };

    keybindings = {
      "<enter>" = "&$OPENER \"$f\"";
      "d" = "delete";
      "x" = "cut";
    };

    commands = {
      extract = pkgs.writeShellScript "lf-extract.sh" ''
        set -f
        case $f in
          *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
          *.tar.gz|*.tgz) tar xzvf $f;;
          *.tar.xz|*.txz) tar xJvf $f;;
          *.zip) unzip $f;;
          *.rar) unrar x $f;;
          *.7z) 7z x $f;;
        esac
      '';
    };
  };
}
