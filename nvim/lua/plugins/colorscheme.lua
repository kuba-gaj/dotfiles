return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },
}
