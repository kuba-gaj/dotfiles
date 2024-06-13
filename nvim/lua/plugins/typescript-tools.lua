return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    tsserver_max_memory = 8096,
    -- tsserver_max_memory = "auto",
  },
}
