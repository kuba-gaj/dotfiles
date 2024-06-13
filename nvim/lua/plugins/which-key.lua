return {
  "folke/which-key.nvim",
  opts = function()
    require("which-key").register({
      ["<leader>gd"] = {
        name = "+DiffView",
      },
      ["<leader>gw"] = {
        name = "+Worktree",
      },
      ["<leader>sr"] = {
        name = "+RgFlow",
      },
    })
  end,
}
