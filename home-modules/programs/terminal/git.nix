{ ... }: {
  programs = {
    git = {
      enable = true;
      userName = "witttccchhher";
      userEmail = "somokill650@gmail.com";
      extraConfig = {
        color.ui = true;
        init.defaultBranch = "master";
        credential.helper = "store";
        core.fscache = false;
      };
    };
  };
}
