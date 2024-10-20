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
