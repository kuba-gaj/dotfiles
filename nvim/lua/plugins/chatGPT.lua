return {
  "jackMort/ChatGPT.nvim",
  enabled = false,
  event = "VeryLazy",
  --  config = true,
  config = function()
    require("chatgpt").setup()
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    openai_params = {
      model = "gpt-4",
    },
  },
  keys = {
    {
      "<leader>Cc",
      ":ChatGPT<CR>",
      desc = "ChatGPT",
    },
    {
      "<leader>Ca",
      ":ChatGPTActAs<CR>",
      desc = "ChatGPTActAs",
    },
    {
      "<leader>Ce",
      ":ChatGPTEditWithInstructions<CR>",
      desc = "ChatGPTEditWithInstructions",
    },
    {
      "<leader>Cr",
      ":ChatGPTRun ", -- no <CR> as action needs to be selected, use tab
      desc = "ChatGPTRun",
    },
  },
}
