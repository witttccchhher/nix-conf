{ config, ... }: {
  programs.fzf = {
    enable = true;
    
    defaultCommand = "fd . --hidden";
    defaultOptions = [ "-e" "-i" "--info=hidden" ];

    colors = with config.lib.stylix.colors; {
      "fg+" = "#${base00}";
      "bg+" = "#${base0C}";
      prompt = "#${base0C}";
      gutter = "#${base00}";
      pointer = "#${base00}";
    };
  };
}
