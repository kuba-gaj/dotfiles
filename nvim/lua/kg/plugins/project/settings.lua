require("project_nvim").setup {
  manual_mode = false,
  detection_methods = { "pattern", "lsp" },
  patterns = { ".git", "package.json", ".projectile" },
  ignore_lsp = { "efm" },
  show_hidden = false,
  silent_chdir = false,
  datapath = vim.fn.stdpath("data"),
}

