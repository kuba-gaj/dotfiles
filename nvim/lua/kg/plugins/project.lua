require("project_nvim").setup {
  manual_mode = false,
  detection_methods = { "pattern", "lsp" },
  patterns = { ".git", "package.json", ".projectile" },
  ignore_lsp = { },
  exclude_dirs = { "~/notes/*" },
  show_hidden = true,
  silent_chdir = false,
  datapath = vim.fn.stdpath("data"),
}

