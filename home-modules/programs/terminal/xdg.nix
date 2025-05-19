{ config, ... }: {
  xdg = let
    hm = config.home.homeDirectory;
  in {
    enable = true;

    cacheHome = builtins.toPath "${hm}/.cache";
    configHome = builtins.toPath "${hm}/.config";
    dataHome = builtins.toPath "${hm}/.local/share";
    stateHome = builtins.toPath "${hm}/.local/state";

    systemDirs = {
      config = [ "/etc/xdg" ];
      data = [ "/usr/share" "/usr/local/share" ];
    };

    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = builtins.toPath "${hm}/Desktop";
      documents = builtins.toPath "${hm}/Documents";
      download = builtins.toPath "${hm}/Downloads";
      music = builtins.toPath "${hm}/Music";
      pictures = builtins.toPath "${hm}/Pictures";
      videos = builtins.toPath "${hm}/Videos";
      publicShare = null;
      templates = null;

      extraConfig = {
        XDG_GIT_DIR = "${hm}/Repositories";
        XDG_PROJECTS_DIR = "${hm}/Projects";
      };
    };
  };
}
