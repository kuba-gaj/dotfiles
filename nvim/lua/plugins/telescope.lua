return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- config = function()
        --   require("telescope").load_extension("live_grep_args")
        -- end,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
        -- opts = function(_, opts)
        --   opts.enabled = false
        -- end,
      },
    },
    keys = {
      {
        "<leader>sg",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args({
            search_dirs = { LazyVim.root() },
          })
        end,
        desc = "Grep (Root dir)",
      },
      {
        "<leader>sG",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep (cwd)",
      },
    },
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      opts.defaults = vim.tbl_extend("force", opts.defaults, {
        mappings = {
          i = {
            ["<c-t>"] = actions.select_tab, -- lazyvim overrides it with lsp errors for all project
          },
        },
      })

      opts.extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          -- mappings = { -- extend mappings
          -- i = {
          -- ["<C-k>"] = lga_actions.quote_prompt(),
          -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
          -- },
          -- },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      }
    end,
    config = function(_, opts)
      local tele = require("telescope")
      tele.setup(opts)
      tele.load_extension("live_grep_args")
    end,
  },
}
