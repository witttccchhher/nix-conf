{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = false;
    extraPackages = with pkgs; [
      nodejs_20
      git
      luajitPackages.luarocks-nix

      lua-language-server
      nixd
      gopls
      basedpyright
      vscode-langservers-extracted
      typescript-language-server
      bash-language-server

      nixfmt-rfc-style

      fontconfig
      fontconfig.lib
    ];
  };
}
