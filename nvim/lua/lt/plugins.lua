local present, packer = pcall(require, 'lt.packer_init')

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
    use {'rcarriga/nvim-notify', config = "require 'lt.plugins.notify'"}

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      config = "require 'lt.plugins.treesitter'",
      run = function() vim.cmd [[TSUpdate]] end
    }
    use 'nvim-treesitter/playground';
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'RRethy/nvim-treesitter-textsubjects'
    use 'haringsrob/nvim_context_vt' -- shows treesitter context in end of parenthesis
    use({'windwp/nvim-ts-autotag', config = "require('nvim-ts-autotag').setup()"})

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = "require 'lt.plugins.telescope'"
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {
      'lazytanuki/nvim-mapper',
      config = "require 'lt.plugins.nvim-mapper'",
      before = 'telescope.nvim'
    }

    -- LSP
    use({'neovim/nvim-lspconfig'})
    use 'williamboman/nvim-lsp-installer'
    use {'tami5/lspsaga.nvim', config = "require 'lt.plugins.lspsaga'"}
    use 'onsails/lspkind-nvim'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use 'nvim-lua/lsp-status.nvim'
    use 'ray-x/lsp_signature.nvim'

    use {
      'ThePrimeagen/refactoring.nvim',
      config = "require 'lt.plugins.refactoring'",
      requires = {
        {'nvim-lua/plenary.nvim'}, {'nvim-treesitter/nvim-treesitter'}
      }
    }
    use {
      'filipdutescu/renamer.nvim',
      requires = {{'nvim-lua/plenary.nvim'}},
      config = "require 'lt.plugins.renamer'"
    }
    use {'stevearc/aerial.nvim', config = "require 'lt.plugins.aerial'"}
    use {'github/copilot.vim', config = "require 'lt.plugins.copilot'"}

    -- Completion
    use({
      'hrsh7th/nvim-cmp',
      config = "require 'lt.plugins.cmp'",
      requires = {
        'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-emoji',
        'ray-x/cmp-treesitter', 'hrsh7th/cmp-calc', 'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp-document-symbol'
      }
    })
    -- Snippets
    use({
      'L3MON4D3/LuaSnip',
      requires = {'rafamadriz/friendly-snippets'},
      config = "require 'lt.plugins.snippets'"
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
    use {'vuki656/package-info.nvim', config = "require 'lt.plugins.package-info'"}
    use {
      'vhyrro/neorg',
      config = "require 'lt.plugins.neorg'",
      requires = {{'nvim-lua/plenary.nvim'}, {'nvim-neorg/neorg-telescope'}}
    }

    -- Git
    use {'tpope/vim-fugitive', config = "require 'lt.plugins.fugitive'"}
    use {'tpope/fugitive-gitlab.vim', requires = {'tpope/vim-fugitive'}}
    use {'lewis6991/gitsigns.nvim', config = "require 'lt.plugins.gitsigns'"}

    -- Motions
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use {'ggandor/lightspeed.nvim', config = "require 'lt.plugins.lightspeed'"}
    use {'bkad/CamelCaseMotion', config = "require 'lt.plugins.camelcasemotion'"}

    -- Editing
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {'numToStr/Comment.nvim', config = "require 'lt.plugins.comment'"}
    use {'folke/todo-comments.nvim', config = "require 'lt.plugins.todo-comments'"}
    use({
      'windwp/nvim-autopairs',
      after = 'nvim-cmp',
      config = "require 'lt.plugins.nvim-autopairs'"
    })

    -- Improvements
    use 'rrethy/vim-illuminate' -- highlight matching words when cursor on it
    use 'romainl/vim-cool' -- disabled search highlight until next search
    use 'numtostr/BufOnly.nvim' -- deletes all buffers except
    use 'tpope/vim-abolish' -- :S to replace with smartcase
    use {'antoinemadec/FixCursorHold.nvim', config = "require 'lt.plugins.fix-cursorhold'"}
    use {'lukas-reineke/indent-blankline.nvim', config = "require 'lt.plugins.indent-blankline'"}
    use {'norcalli/nvim-colorizer.lua', config = "require 'lt.plugins.nvim-colorizer'"}
    use {'karb94/neoscroll.nvim', config = "require 'lt.plugins.neoscroll'"}

    -- General
    use 'mbbill/undotree'
    use {'ahmedkhalf/project.nvim', config = "require 'lt.plugins.project'"}
    use {'rmagatti/auto-session', config = "require('auto-session').setup({})"}
    use {'kevinhwang91/nvim-bqf', config = "require 'lt.plugins.nvim-bqf'"}
    use {'dyng/ctrlsf.vim', config = "require 'lt.plugins.ctrlsf'"}
    use {'andymass/vim-matchup', config = "require 'lt.plugins.vim-matchup'"}
    use {'Pocco81/TrueZen.nvim', config = "require 'lt.plugins.truezen'"}
    use {'folke/which-key.nvim', config = "require 'lt.plugins.which-key'"}
    use {
      'ThePrimeagen/harpoon',
      config = "require 'lt.plugins.harpoon'",
      requires = 'nvim-lua/plenary.nvim'
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = "require 'lt.plugins.nvim-tree'"
    }

    -- status line
    use {
      'SmiteshP/nvim-gps',
      requires = 'nvim-treesitter/nvim-treesitter',
      config = "require 'lt.plugins.nvim-gps'"
    }
    use {
      'NTBBloodbath/galaxyline.nvim',
      requires = 'SmiteshP/nvim-gps',
      config = "require 'lt.plugins.galaxyline'"
    }
  end
}
