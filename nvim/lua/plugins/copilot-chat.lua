return {
  {
    "folke/edgy.nvim",
    optional = true,
    opts = function(_, opts)
      opts.right = opts.right or {}
      for i, v in ipairs(opts.right) do
        if v.ft == "copilot-chat" then
          opts.right[i] = {
            ft = "copilot-chat",
            title = "Copilot Chat",
            size = { width = 70 },
          }
          break
        end
      end
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      show_help = false,
      auto_follow_cursor = false,
      show_folds = true,
      auto_insert_mode = false,
      clear_chat_on_new_prompt = false,
      highlight_selection = true,
      context = nil,
      mappings = {
        reset = {
          normal = "R",
          insert = false,
        },
      },
    },
  },
}
