{ pkgs, config, extraColors, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      vscode-langservers-extracted
      pyright
      nixd
      nodejs_20
    ];
  };

  xdg.configFile = {
    "nvim/init.lua".text = builtins.readFile /home/som/nix/home/som/neovim/init.lua;
    "nvim/lua/configs/options.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/configs/options.lua;
    "nvim/lua/configs/mappings.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/configs/mappings.lua;
    "nvim/lua/configs/base16.lua".text = with config.lib.stylix.colors; ''
require("mini.base16").setup({
  palette = {
    base00 = "#${base00}",
    base01 = "#${base01}",
    base02 = "#${base02}",
    base03 = "#${extraColors.base0H}",
    base04 = "#${base05}",
    base05 = "#${base07}",
    base06 = "#${base06}",
    base07 = "#${base06}",
    base08 = "#${base08}",
    base09 = "#${base09}",
    base0A = "#${base0A}",
    base0B = "#${base0B}",
    base0C = "#${extraColors.base0G}",
    base0D = "#${base0D}",
    base0E = "#${base0C}",
    base0F = "#${base0F}"
  }
})
    '';
    "nvim/lua/configs/comments.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/configs/comments.lua;
    "nvim/lua/configs/hues.lua".text = with config.lib.stylix.colors; ''
require("mini.hues").setup({
  background = "#${base00}",
  foreground = "#${base05}",
  saturation = "low",
  accent = "bg"
})
    '';
    "nvim/lua/configs/icons.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/configs/icons.lua;
    "nvim/lua/configs/lsp.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/configs/lsp.lua;
    "nvim/lua/configs/notifyes.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/configs/notifyes.lua;
    "nvim/lua/configs/statusline.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/configs/statusline.lua;
    "nvim/lua/configs/tabline.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/configs/tabline.lua;
    "nvim/lua/plugins/init.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/plugins/init.lua;
    "nvim/lua/plugins/lspconfig.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/plugins/lspconfig.lua;
    "nvim/lua/plugins/colorizer.lua".text = builtins.readFile /home/som/nix/home/som/neovim/lua/plugins/colorizer.lua;
  };
}
