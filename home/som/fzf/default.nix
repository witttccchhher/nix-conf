{ config, ... }: {
  programs.fzf = {
    enable = true;
    
    defaultCommand = "fd . --hidden";
    defaultOptions = [
      "-e"
      "-i"
      "--algo=v1"
      "--no-mouse"
      "-m"
      "--height=20"
      "--reverse"
      "--border=rounded"
      "--no-scrollbar"
      "--prompt='󰱼 '"
      "--pointer=''"
      "--preview='preview.sh {}'"
    ];

    colors = with config.lib.stylix.colors.withHashtag; {
      fg = "${base06}";
      bg = "${base00}";
      preview-fg = "${base06}";
      preview-bg = "${base00}";
      hl = "${base08}";
      "fg+" = "${base00}";
      "bg+" = "${base0B}";
      gutter = "${base0B}";
      "hl+" = "${base00}";
      info = "${base0C}";
      border = "${base03}";
      prompt = "${base0C}";
      pointer = "${base00}";
      marker = "${base0E}";
      spinner = "${base0C}";
      header = "${base0C}";
    };
  };
}
