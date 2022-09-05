local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

-- remove the dir before cloning
if fn.empty(fn.glob(install_path)) > 0 then
  print "Cloning packer.."
  fn.delete(install_path, "rf")

  fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
end

vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
    prompt_border = "single",
  },
  git = {
    clone_timeout = 600, -- Timeout, in seconds, for git clones
  },
  auto_clean = true,
  compile_on_sync = true,
  --    auto_reload_compiled = true
}

return packer.startup {
  function(use)
    use { "wbthomason/packer.nvim", event = "VimEnter" }

    -- Need to load first
    use { "lewis6991/impatient.nvim", rocks = "mpack" }
    -- use({ "nathom/filetype.nvim" }) -- breaks bqf preview syntax hightlighting (https://github.com/kevinhwang91/nvim-bqf/issues/43)
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- Theming
    use {
      "ellisonleao/gruvbox.nvim",
      config = "require 'kg.plugins.gruvbox'",
      requires = { "rktjmp/lush.nvim" },
    }

    -- UI
    use "MunifTanjim/nui.nvim"
    use { "stevearc/dressing.nvim", config = "require 'kg.plugins.dressing'" }
    use { "rcarriga/nvim-notify", config = "require 'kg.plugins.notify'" }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      config = "require 'kg.plugins.treesitter'",
      run = function()
        vim.cmd [[TSUpdate]]
      end,
    }
    use "nvim-treesitter/playground"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "RRethy/nvim-treesitter-textsubjects"
    use "haringsrob/nvim_context_vt" -- shows treesitter context in end of parenthesis
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use { "p00f/nvim-ts-rainbow", after = { "nvim-treesitter" } }
    use { "windwp/nvim-ts-autotag", config = "require('nvim-ts-autotag').setup()" }

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-ui-select.nvim" },
      },
      config = "require 'kg.plugins.telescope'",
    }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    use "williamboman/nvim-lsp-installer"
    use "b0o/schemastore.nvim"
    use "onsails/lspkind-nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "nvim-lua/lsp-status.nvim"

    use {
      "danymat/neogen",
      config = "require 'kg.plugins.neogen'",
      requires = "nvim-treesitter/nvim-treesitter",
    }

    use {
      "ThePrimeagen/refactoring.nvim",
      config = "require 'kg.plugins.refactoring'",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
      },
    }

    use {
      "j-hui/fidget.nvim",
      config = function()
        require "kg.plugins.fidget"
      end,
    }

    use {
      "zbirenbaum/copilot.lua",
      event = "InsertEnter",
      config = function()
        vim.schedule(function()
          require("copilot").setup()
        end)
      end,
    }
    use { "github/copilot.vim", config = "require 'kg.plugins.copilot'" }

    use { "jose-elias-alvarez/null-ls.nvim" }

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      config = "require 'kg.plugins.cmp'",
      requires = {
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-emoji",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        -- "David-Kunz/cmp-npm",
      },
    }
    use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua", "nvim-cmp" },
    }

    -- Snippets
    use {
      "L3MON4D3/LuaSnip",
      requires = { "rafamadriz/friendly-snippets" },
      config = "require 'kg.plugins.snippets'",
    }

    -- Languages
    use "hashivim/vim-terraform"
    use "kevinoid/vim-jsonc"
    use {
      "Fymyte/rasi.vim",
      ft = { "rasi" },
      run = ":TSInstall rasi",
      requires = { "nvim-treesitter/nvim-treesitter" },
    }
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    }
    use {
      "bennypowers/nvim-regexplainer",
      config = "require 'kg.plugins.regexplainer'",
      requires = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
      },
    }
    use {
      "ellisonleao/glow.nvim",
      config = function()
        vim.g.glow_border = "rounded"
      end,
    }
    -- use({ "vuki656/package-info.nvim", config = "require 'kg.plugins.package-info'" })

    -- Git
    use { "tpope/vim-fugitive", config = "require 'kg.plugins.fugitive'" }
    use { "tpope/fugitive-gitlab.vim", requires = { "tpope/vim-fugitive" } }
    use { "lewis6991/gitsigns.nvim", config = "require 'kg.plugins.gitsigns'" }
    use {
      "sindrets/diffview.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require "kg.plugins.diffview"
      end,
    }
    use { "ThePrimeagen/git-worktree.nvim", config = "require 'kg.plugins.git-worktree'" }

    -- Motions
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use { "phaazon/hop.nvim", config = "require 'kg.plugins.hop'" }
    -- use { "ggandor/leap.nvim", config = "require 'kg.plugins.leap'" }
    use { "bkad/CamelCaseMotion", config = "require 'kg.plugins.camelcasemotion'" }
    use { "kevinhwang91/nvim-hlslens", config = "require 'kg.plugins.hlslens'" }

    -- Editing
    use { "numToStr/Comment.nvim", config = "require 'kg.plugins.comment'" }
    use { "folke/todo-comments.nvim", config = "require 'kg.plugins.todo-comments'" }
    use {
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = "require 'kg.plugins.autopairs'",
    }

    -- Debugging
    use { "mfussenegger/nvim-dap", config = "require 'kg.plugins.dap'" }
    use { "nvim-telescope/telescope-dap.nvim", requires = { "mfussenegger/nvim-dap" } }
    use {
      "theHamsta/nvim-dap-virtual-text",
      requires = { "mfussenegger/nvim-dap" },
      config = "require('kg.plugins.dap-virtual-text')",
    }
    use {
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
      config = "require('kg.plugins.dap-ui')",
    }
    use {
      "Pocco81/DAPInstall.nvim",
      requires = { "mfussenegger/nvim-dap" },
      config = "require('kg.plugins.dap-install')",
    }

    -- Improvements
    use "rrethy/vim-illuminate" -- highlight matching words when cursor on it
    use "romainl/vim-cool" -- disabled search highlight until next search
    use "numtostr/BufOnly.nvim" -- deletes all buffers except
    use "tpope/vim-abolish" -- :S to replace with smartcase
    use { "antoinemadec/FixCursorHold.nvim", config = "require 'kg.plugins.fix-cursorhold'" }
    use { "lukas-reineke/indent-blankline.nvim", config = "require 'kg.plugins.indent-blankline'" }
    use { "norcalli/nvim-colorizer.lua", config = "require 'kg.plugins.colorizer'" }
    use { "karb94/neoscroll.nvim", config = "require 'kg.plugins.neoscroll'" }
    use { "monaqa/dial.nvim", config = "require 'kg.plugins.dial'" }
    use { "mvllow/modes.nvim", config = "require 'kg.plugins.modes'" }
    use { "mrjones2014/smart-splits.nvim", config = "require 'kg.plugins.smart-splits'" }
    -- General
    use "mbbill/undotree"
    use { "ahmedkhalf/project.nvim", config = "require 'kg.plugins.project'" }
    use { "rmagatti/auto-session", config = "require('auto-session').setup({})" }
    use { "kevinhwang91/nvim-bqf", config = "require 'kg.plugins.bqf'" }
    use { "mhinz/vim-grepper", config = "require 'kg.plugins.grepper'" }
    use { "dyng/ctrlsf.vim", config = "require 'kg.plugins.ctrlsf'" }
    use { "andymass/vim-matchup", config = "require 'kg.plugins.vim-matchup'" }
    use { "Pocco81/TrueZen.nvim", config = "require 'kg.plugins.truezen'" }

    -- use { "hoschi/yode-nvim", config = "require 'kg.plugins.yode'" } -- was broken
    use { "Everduin94/nvim-quick-switcher", config = "require 'kg.plugins.quick-switcher'" }
    use { "petertriho/nvim-scrollbar", config = "require 'kg.plugins.scrollbar'" }

    use { "folke/which-key.nvim", config = "require 'kg.plugins.which-key'" }
    use {
      "ThePrimeagen/harpoon",
      config = "require 'kg.plugins.harpoon'",
      requires = "nvim-lua/plenary.nvim",
    }
    use {
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
      config = "require 'kg.plugins.nvim-tree'",
    }
    use {
      "anuvyklack/pretty-fold.nvim",
      requires = "anuvyklack/nvim-keymap-amend",
      config = function()
        require "kg.plugins.pretty-fold"
      end,
    }

    use { "mickael-menu/zk-nvim", config = "require 'kg.plugins.zk'" }

    -- status line
    use {
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter",
      config = "require 'kg.plugins.gps'",
    }

    use({
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
    })

    use {
      "feline-nvim/feline.nvim",
      requires = "SmiteshP/nvim-gps",
      config = "require 'kg.plugins.feline'",
    }
  end,
}
