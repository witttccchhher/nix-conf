{ ... }: {
  programs = {
    git = {
      enable = true;
      extraConfig = {
        color.ui = true;
        init.defaultBranch = "master";
        credential.helper = "store";
      };
    };
  };
}
