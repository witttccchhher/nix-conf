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
    "nvim/init.lua".text = ''
require("configs.options")
require("configs.mappings")

local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
end

require("configs.hues")
require("mini.pairs").setup()
require("configs.statusline")
require("configs.base16")
require("configs.comments")
require("configs.lsp")
require("configs.icons")
require("configs.tabline")
require("mini.extra").setup()
require("mini.pick").setup()
require("configs.notifyes")
require("plugins.init")
    '';
    "nvim/lua/configs/options.lua".text = ''
local o = vim.opt
o.cmdheight = 0
o.number = true
o.relativenumber = false
o.mouse = ""
o.conceallevel = 1
o.cursorline = false
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.termguicolors = true
o.clipboard = "unnamedplus"
vim.g.mapleader = " "
    '';
    "nvim/lua/configs/mappings.lua".text = ''
local map = vim.keymap.set
local defaults = { noremap = true, silent = true }
map("n", "<leader>x", ":bd<cr>")
map("n", "<tab>", ":bn<cr>")
map("n", "<C-s>", ":w!<cr>")
map("n", "<leader>n", ":Pick explorer<cr>")
map("n", "<leader>f", ":Pick files<cr>")
map("n", "q", ":q<cr>")
map("n", ";", ":")
map("n", "<leader>t", ":bo term<cr>i")
map("n", "<leader>r", ":!python main.py<cr>")
    '';
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
    "nvim/lua/configs/comments.lua".text = ''
require("mini.comment").setup({
  mappings = {
    comment_line = "<leader>/"
  }
})
    '';
    "nvim/lua/configs/hues.lua".text = with config.lib.stylix.colors; ''
require("mini.hues").setup({
  background = "#${base00}",
  foreground = "#${base05}",
  saturation = "low",
  accent = "bg"
})
    '';
    "nvim/lua/configs/icons.lua".text = ''
require("mini.icons").setup({
  style = "glyph"
})

MiniIcons.tweak_lsp_kind()
    '';
    "nvim/lua/configs/lsp.lua".text = ''
require("mini.completion").setup({
  delay = { completion = 0, info = 0, signature = 0 },
  window = {
    info = { border = "rounded" },
    signature = { border = "rounded" }
  },
  lsp_completion = {
    source_func = "completefunc",
    auto_setup = true
  }
})
    '';
    "nvim/lua/configs/notifyes.lua".text = ''
require("mini.notify").setup({
  window = { config = { border = "rounded" } }
})
    '';
    "nvim/lua/configs/statusline.lua".text = ''
require("mini.statusline").setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 0 })
      local git = MiniStatusline.section_git({ trunc_width = 40 })
      local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
      local filename = MiniStatusline.section_filename({ trunc_width = 140 })
      local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
      local location = MiniStatusline.section_location({ trunc_width = 200 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=",
        { hl = mode_hl, strings = { search, location } }
      })
    end
  }
})
    '';
    "nvim/lua/configs/tabline.lua".text = ''
require("mini.tabline").setup({
  show_icons = true
})
    '';
    "nvim/lua/plugins/init.lua".text = ''
require("mini.deps").setup()
local add = MiniDeps.add

add({
  source = "neovim/nvim-lspconfig",
  depends = {
    "williamboman/mason.nvim",
    "lukas-reineke/lsp-format.nvim"
  }
})

add({
  source = "norcalli/nvim-colorizer.lua"
})

add({
  source = "nvim-treesitter/nvim-treesitter"
})

require("mason").setup()
require("plugins.lspconfig")
require("plugins.colorizer")
    '';
    "nvim/lua/plugins/lspconfig.lua".text = ''
local lspconfig = require("lspconfig")

require('lsp-format').setup()
local function on_attach(client, bufnr)
  MiniCompletion.completefunc_lsp()
  require('lsp-format').on_attach(client, bufnr)
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

servers = { "nixd", "html", "cssls", "ts_ls", "pyright" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach
  })
end
    '';
    "nvim/lua/plugins/colorizer.lua".text = ''
require("colorizer").setup({
  DEFAULT_OPTIONS = {
    RGB      = true;         -- #RGB hex codes
    RRGGBB   = true;         -- #RRGGBB hex codes
    names    = true;         -- "Name" codes like Blue
    RRGGBBAA = true;        -- #RRGGBBAA hex codes
    rgb_fn   = true;        -- CSS rgb() and rgba() functions
    hsl_fn   = true;        -- CSS hsl() and hsla() functions
    css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
    -- Available modes: foreground, background
    mode     = 'background'; -- Set the display mode.
  },
  "nix", "*";
})
    '';
  };
}
