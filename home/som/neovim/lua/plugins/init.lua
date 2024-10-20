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
