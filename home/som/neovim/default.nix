{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      nodejs_20
      git
      luajitPackages.luarocks-nix
      silicon

      lua-language-server
      nixd
      gopls
      basedpyright
      vscode-langservers-extracted
      typescript-language-server

      nixfmt-rfc-style
    ];
  };
}
