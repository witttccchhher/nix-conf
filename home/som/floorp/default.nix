{ pkgs, inputs, ... }: {
  imports = [ ]; 
  programs.floorp = {
    enable = true;
    package = pkgs.floorp;
    languagePacks = [ "en" "ru" ];
    profiles.som = {
      id = 0;
      name = "som";
      isDefault = true;
      extensions = with inputs.firefox-addons.packages."${pkgs.system}"; [
        translate-web-pages
        stylus
      ];
      userChrome = builtins.readFile ./userChrome.css;
      userContent = builtins.readFile ./userContent.css;
    };
  };
}
