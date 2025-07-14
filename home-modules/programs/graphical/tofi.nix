{ config, ... }: {
  programs.tofi = {
    enable = true;
    settings = with config.lib.stylix.colors.withHashtag; {
      font-size = 12;
      font = "CommitMono";
      font-features = "calt, ss01, ss02, ss03, ss04, ss05, cv01, cv02, cv03, cv04, cv05, cv06, cv08, cv09, cv10, cv11";

      text-color = base07;
      prompt-color = base07;
      prompt-background = base00;
      placeholder-color = base07;
      placeholder-background = base00;
      input-color = base07;
      input-background = base00;
      default-result-color = base07;
      default-result-background = base00;
      selection-color = base00;
      selection-background = base0C;
      selection-match-color = base00;
      background-color = base00;

      result-spacing = 15;
      horizontal = true;
      min-input-width = 80;

      anchor = "top";

      width = "100%";
      height = 35;
      outline-width = 0;
      border-width = 0;
      
      padding-top = 8;
      padding-bottom = 0;
      padding-left = 0;
      padding-right = 0;

      matching-algorithm = "fuzzy";
      drun-launch = true;
    };
  };
}
