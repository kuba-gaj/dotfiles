require("which-key").setup{
  triggers = "auto"
}

require("which-key").register({
  ["<leader>"] = {
    p = { name = "+search" },
    b = { name = "+buffer" },
    g = { name = "+git" }
  }
});
