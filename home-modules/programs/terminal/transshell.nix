{ pkgs, ... }: {
  home.packages = [ pkgs.translate-shell ];
  xdg.configFile."translate-shell/init.trans".text = ''
    {
      :verbose        false
      :indent         2
      :engine         "google"
    }
  '';
}
