{ pkgs, ... }: {
  programs = {
    zathura = {
      enable = true;
      extraConfig = ''
        set font "JetBrainsMono Nerd Font 12"
      '';
    };
    git = {
      enable = true;
      extraConfig = {
        color.ui = true;
        init.defaultBranch = "master";
        credential.helper = "store";
      };
    };
    lazygit = {
      enable = true;
      settings = {
        gui = {
          mouseEvents = false;
          theme = {
            activeBorderColor = [ "magenta" "bold" ];
            inactiveBorderColor = [ "default" ];
          };
        };
      };
    };
    lsd = {
      enable = true;
      enableAliases = false;
      settings = {
        layout = "grid";
        icons = {
          when = "always";
          theme = "fancy";
          separator = "  ";
        };
      };
    };
    mpv = {
      enable = true;
      config = {
        player-operation-mode = "pseudo-gui";
        # osc = "no";
        # border = "no";
      };
    };
    ncmpcpp = {
      enable = true;
      package = pkgs.ncmpcpp;
      mpdMusicDir = /home/som/Music;
      settings = {
        colors_enabled = "yes";
        message_delay_time = 1;
        playlist_disable_highlight_delay = 2;
        autocenter_mode = "yes";
        centered_cursor = "yes";
        ignore_leading_the = "yes";
        allow_for_physical_item_deletion = "no";
        playlist_display_mode = "columns";
        user_interface = "classic";
        volume_color = "blue";
        statusbar_visibility = "no";
        header_visibility = "no";
        titles_visibility = "no";
        progressbar_look = "▂▂▂";
        progressbar_color = "black";
        progressbar_elapsed_color = "blue";
        song_status_format = "$7%t";
        song_list_format = "  %t $R%a %l  ";
        song_columns_list_format = "(53)[white]{tr} (45)[blue]{a}";
        song_library_format = "{{%a - %t} (%b)}|{%f}";
      };
    };
  };
}
