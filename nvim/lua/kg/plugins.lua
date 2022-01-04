local present, packer = pcall(require, 'kg.packer_init')

if not present then return false end

return packer.startup {
  function(use)
    use({'wbthomason/packer.nvim', event = 'VimEnter'})

    -- Need to load first
    use {'lewis6991/impatient.nvim', rocks = 'mpack'}
    use {'nathom/filetype.nvim'}
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Theming
    use 'gruvbox-community/gruvbox'

    -- UI
    use 'MunifTanjim/nui.nvim'
    use 'stevearc/dressing.nvim'
    use {'rcarriga/nvim-notify', config = "require 'kg.plugins.notify'"}

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      config = "require 'kg.plugins.treesitter'",
      run = function() vim.cmd [[TSUpdate]] end
    }
    use 'nvim-treesitter/playground';
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'RRethy/nvim-treesitter-textsubjects'
    use 'haringsrob/nvim_context_vt' -- shows treesitter context in end of parenthesis
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {'p00f/nvim-ts-rainbow', after = {'nvim-treesitter'}}
    use {'windwp/nvim-ts-autotag', config = "require('nvim-ts-autotag').setup()"}

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = "require 'kg.plugins.telescope'"
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {
      'lazytanuki/nvim-mapper',
      config = "require 'kg.plugins.mapper'",
      before = 'telescope.nvim'
    }

    -- LSP
    use({'neovim/nvim-lspconfig'})
    use 'williamboman/nvim-lsp-installer'
    use 'b0o/schemastore.nvim'
    use {'tami5/lspsaga.nvim', config = "require 'kg.plugins.lspsaga'"}
    use 'onsails/lspkind-nvim'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use 'nvim-lua/lsp-status.nvim'
    use 'ray-x/lsp_signature.nvim'

    use {
      'ThePrimeagen/refactoring.nvim',
      config = "require 'kg.plugins.refactoring'",
      requires = {
        {'nvim-lua/plenary.nvim'}, {'nvim-treesitter/nvim-treesitter'}
      }
    }
    use {
      'filipdutescu/renamer.nvim',
      requires = {{'nvim-lua/plenary.nvim'}},
      config = "require 'kg.plugins.renamer'"
    }
    -- use {'stevearc/aerial.nvim', config = "require 'kg.plugins.aerial'"}
    use {'github/copilot.vim', config = "require 'kg.plugins.copilot'"}
    use {
      'folke/trouble.nvim',
      config = function() require('kg.plugins.trouble') end
    }

    use {
      'creativenull/efmls-configs-nvim',
      -- tag = 'v0.1.1', -- tag is optional
      requires = { 'neovim/nvim-lspconfig' },
    }

    -- Completion
    use({
      'hrsh7th/nvim-cmp',
      config = "require 'kg.plugins.cmp'",
      requires = {
        'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-emoji',
        'ray-x/cmp-treesitter', 'hrsh7th/cmp-calc', 'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp-document-symbol', 'David-Kunz/cmp-npm',
      }
    })
    use {'David-Kunz/cmp-npm', requires = 'nvim-lua/plenary.nvim'}

    -- Snippets
    use({
      'L3MON4D3/LuaSnip',
      requires = {'rafamadriz/friendly-snippets'},
      config = "require 'kg.plugins.snippets'"
    })

    -- Languages
    use 'hashivim/vim-terraform'
    use 'kevinoid/vim-jsonc'
    use({
      'iamcco/markdown-preview.nvim',
      run = 'cd app && yarn',
      setup = function() vim.g.mkdp_filetypes = {'markdown'} end,
      ft = {'markdown'}
    })
    use {'ellisonleao/glow.nvim', config = function() vim.g.glow_border = "rounded" end}
    use {'vuki656/package-info.nvim', config = "require 'kg.plugins.package-info'"}

    -- Git
    use {'tpope/vim-fugitive', config = "require 'kg.plugins.fugitive'"}
    use {'tpope/fugitive-gitlab.vim', requires = {'tpope/vim-fugitive'}}
    use {'lewis6991/gitsigns.nvim', config = "require 'kg.plugins.gitsigns'"}
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Motions
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use {'ggandor/lightspeed.nvim', config = "require 'kg.plugins.lightspeed'"}
    use {'bkad/CamelCaseMotion', config = "require 'kg.plugins.camelcasemotion'"}

    -- Editing
    use {'numToStr/Comment.nvim', config = "require 'kg.plugins.comment'"}
    use {'folke/todo-comments.nvim', config = "require 'kg.plugins.todo-comments'"}
    use({
      'windwp/nvim-autopairs',
      after = 'nvim-cmp',
      config = "require 'kg.plugins.autopairs'"
    })

    -- Improvements
    use 'rrethy/vim-illuminate' -- highlight matching words when cursor on it
    use 'romainl/vim-cool' -- disabled search highlight until next search
    use 'numtostr/BufOnly.nvim' -- deletes all buffers except
    use 'tpope/vim-abolish' -- :S to replace with smartcase
    use {'antoinemadec/FixCursorHold.nvim', config = "require 'kg.plugins.fix-cursorhold'"}
    use {'lukas-reineke/indent-blankline.nvim', config = "require 'kg.plugins.indent-blankline'"}
    use {'norcalli/nvim-colorizer.lua', config = "require 'kg.plugins.colorizer'"}
    use {'karb94/neoscroll.nvim', config = "require 'kg.plugins.neoscroll'"}

    -- General
    use 'mbbill/undotree'
    use {'ahmedkhalf/project.nvim', config = "require 'kg.plugins.project'"}
    use {'rmagatti/auto-session', config = "require('auto-session').setup({})"}
    use {'kevinhwang91/nvim-bqf', config = "require 'kg.plugins.bqf'"}
    use {'dyng/ctrlsf.vim', config = "require 'kg.plugins.ctrlsf'"}
    use {'andymass/vim-matchup', config = "require 'kg.plugins.vim-matchup'"}
    use {'Pocco81/TrueZen.nvim', config = "require 'kg.plugins.truezen'"}
    use {'folke/which-key.nvim', config = "require 'kg.plugins.which-key'"}
    use {
      'ThePrimeagen/harpoon',
      config = "require 'kg.plugins.harpoon'",
      requires = 'nvim-lua/plenary.nvim'
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = "require 'kg.plugins.nvim-tree'"
    }

    -- status line
    use {
      'SmiteshP/nvim-gps',
      requires = 'nvim-treesitter/nvim-treesitter',
      config = "require 'kg.plugins.gps'"
    }
    use {
      'NTBBloodbath/galaxyline.nvim',
      requires = 'SmiteshP/nvim-gps',
      config = "require 'kg.plugins.galaxyline'"
    }
  end
}
