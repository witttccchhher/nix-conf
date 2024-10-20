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
