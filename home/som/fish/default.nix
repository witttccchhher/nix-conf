{ pkgs, config, ... }: {
  programs.fish = {
    enable = false;
    package = pkgs.fish;
    generateCompletions = false;
    shellInitLast = ''
      fish_vi_key_bindings
    '';
    functions = {
      fish_prompt = with config.lib.stylix.colors; ''
        if test -n "$IN_NIX_SHELL"
          printf "%s" (set_color -o ${base03}) "" (set_color normal) (set_color -o ${base0C}) (set_color -b ${base03}) (pwd) (set_color normal) (set_color -o ${base03}) "" (set_color normal) (set_color -o ${base0C}) " 󱄅  "
        else  
          printf "%s" (set_color -o ${base03}) "" (set_color normal) (set_color -o ${base05}) (set_color -b ${base03}) (pwd) (set_color normal) (set_color -o ${base03}) "" (set_color normal) (set_color -o ${base05}) " 󱄅  "
        end
      '';
      fish_mode_prompt = with config.lib.stylix.colors; ''
        switch $fish_bind_mode
          case default
            set_color -o ${base03}
            echo -e \n""
            set_color normal
            set_color -o ${base0C}
            set_color -b ${base03}
            echo -e "NORMAL"
            set_color normal
            set_color -o ${base03}
            echo -e " "
          case insert
            set_color -o ${base03}
            echo -e \n""
            set_color normal
            set_color -o ${base0B}
            set_color -b ${base03}
            echo -e "INSERT"
            set_color normal
            set_color -o ${base03}
            echo -e " "
          case replace
            set_color -o ${base03}
            echo -e \n""
            set_color normal
            set_color -o ${base08}
            set_color -b ${base03}
            echo -e "REPLACE"
            set_color normal
            set_color -o ${base03}
            echo -e " "
          case replace_one
            set_color -o ${base03}
            echo -e \n""
            set_color normal
            set_color -o ${base08}
            set_color -b ${base03}
            echo -e "REPLACE"
            set_color normal
            set_color -o ${base03}
            echo -e " "
          case visual
            set_color -o ${base03}
            echo -e \n""
            set_color normal
            set_color -o ${base09}
            set_color -b ${base03}
            echo -e "VISUAL"
            set_color normal
            set_color -o ${base03}
            echo -e " "
        end
        set_color normal
      '';
    };
    shellAliases = {
      "x" = "exit";
      "c" = "clear";

      "ls" = "lsd -a";
      "ll" = "lsd -a -l";

      "ns" = "nix-shell --run fish";
      "flakeu" = "nix flake update --flake 'path:/home/som/nix/'";
      "nixgitu" = "cd ~/nix/ && git add * && git commit -m 'Some changes' && cd";

      "e" = "nvim";
      "fe" = "nvim $(fzf)";
      "pe" = "nvim ~/nix/home/som/packages/default.nix";

      "y" = "yazi";
      "fetch" = "nitch";
    };
  };

  xdg.configFile."fish/themes/chocolate.theme".text = ''
fish_color_normal ${config.lib.stylix.colors.base05}
fish_color_command ${config.lib.stylix.colors.base0C}
fish_color_param ${config.lib.stylix.colors.base0D}
fish_color_keyword ${config.lib.stylix.colors.base05}
fish_color_quote ${config.lib.stylix.colors.base0A}
fish_color_redirection ${config.lib.stylix.colors.base09}
fish_color_end ${config.lib.stylix.colors.base05}
fish_color_comment 3d3837
fish_color_error ${config.lib.stylix.colors.base0E}
fish_color_gray 3d3837
fish_color_selection --background=${config.lib.stylix.colors.base04}
fish_color_search_match --background=${config.lib.stylix.colors.base04}
fish_color_option ${config.lib.stylix.colors.base0D}
fish_color_operator ${config.lib.stylix.colors.base0D}
fish_color_escape ${config.lib.stylix.colors.base05}
fish_color_autosuggestion 3d3837
fish_color_cancel ${config.lib.stylix.colors.base05}
fish_color_cwd ${config.lib.stylix.colors.base05}
fish_color_user ${config.lib.stylix.colors.base05}
fish_color_host ${config.lib.stylix.colors.base05}
fish_color_host_remote ${config.lib.stylix.colors.base05}
fish_color_status ${config.lib.stylix.colors.base05}
fish_pager_color_progress ${config.lib.stylix.colors.base05}
fish_pager_color_prefix ${config.lib.stylix.colors.base05}
fish_pager_color_completion ${config.lib.stylix.colors.base05}
fish_pager_color_description ${config.lib.stylix.colors.base05}
  '';
}
