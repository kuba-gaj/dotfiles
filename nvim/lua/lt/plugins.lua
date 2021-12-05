local present, packer = pcall(require, 'lt.packer_init')

if not present then return false end

return packer.startup {
    function(use)
        use({'wbthomason/packer.nvim', event = 'VimEnter'})

        use {
            'antoinemadec/FixCursorHold.nvim',
            config = function() require 'lt.plugins.fix-cursorhold' end
        } -- Fix CursorHold Performance

        use 'nvim-lua/plenary.nvim'

        use {
            'lazytanuki/nvim-mapper',
            config = function() require 'lt.plugins.nvim-mapper' end,
            before = 'telescope.nvim'
        }

        use 'MunifTanjim/nui.nvim' -- ui library

        use {
            'rcarriga/nvim-notify', -- notifications
            config = function() require 'lt.plugins.notify' end
        }

        -- icons
        use 'kyazdani42/nvim-web-devicons'

        use {
            'tpope/vim-fugitive',
            config = function() require 'lt.plugins.fugitive' end
        }
        use {
            'lewis6991/gitsigns.nvim',
            config = function() require 'lt.plugins.gitsigns' end
        }

        use {
            'ahmedkhalf/project.nvim',
            config = function() require 'lt.plugins.project' end
        }

        use {
            'shatur/neovim-session-manager',
            config = function() require 'lt.plugins.neovim-session-manager' end
        }

        -- use {
        --   'rmagatti/auto-session',
        --   config = function() require 'auto-session'.setup({}) end
        -- }

        use 'mbbill/undotree' -- undo tree
        use {
            'kevinhwang91/nvim-bqf',
            config = function() require 'lt.plugins.nvim-bqf' end
        }

        --[[ use {
            'jdhao/better-escape.vim',
            config = function() require 'lt.plugins.better-escape' end
        }
 ]]
        use {
            'ggandor/lightspeed.nvim',
            config = function() require 'lt.plugins.lightspeed' end
        }

        -- use 'b3nj5m1n/kommentary'
        use 'JoosepAlviste/nvim-ts-context-commentstring'
        use {
          'numToStr/Comment.nvim',
          config = function() require('lt.plugins.comment') end
        }

        use 'tpope/vim-surround' -- Change surrounding arks
        use 'tpope/vim-repeat' -- extends . repeat, for example for make it work with vim-sneak
        use {
            'bkad/CamelCaseMotion',
            config = function() require 'lt.plugins.camelcasemotion' end
        } -- allows to move by camelCase with w e

        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function() require 'lt.plugins.indent-blankline' end
        }
 
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
            config = function() require 'lt.plugins.telescope' end
        }
        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

        use {
            'dyng/ctrlsf.vim',
            config = function() require 'lt.plugins.ctrlsf' end
        }
        use {
            'norcalli/nvim-colorizer.lua',
            config = function() require 'lt.plugins.nvim-colorizer' end
        } -- preview hex colors

        use 'rrethy/vim-illuminate' -- highlight matching words when cursor on it

        -- use 'gennaro-tedesco/nvim-peekup' -- shows register preview
        use 'numtostr/BufOnly.nvim' -- deletes all buffers except
        use {
            'karb94/neoscroll.nvim',
            config = function() require 'lt.plugins.neoscroll' end
        }
        use 'romainl/vim-cool' -- disabled search highlight until next search

        use {
          "folke/which-key.nvim",
          config = function() require 'lt.plugins.which-key' end
        }

       use {
           'ThePrimeagen/refactoring.nvim',
           config = function() require 'lt.plugins.refactoring' end,
           requires = {
               {'nvim-lua/plenary.nvim'}, {'nvim-treesitter/nvim-treesitter'}
           }
       }

        use {
            'kyazdani42/nvim-tree.lua',
            requires = {'kyazdani42/nvim-web-devicons'},
            config = function() require 'lt.plugins.nvim-tree' end
        }

        use 'tpope/vim-abolish' -- :S to replace with smartcase

        -- Autocomplete & Linters
        use 'neovim/nvim-lspconfig'
        use 'nvim-lua/lsp-status.nvim'
        use {
          'tami5/lspsaga.nvim',
          config = function() require 'lt.plugins.lspsaga' end
        }
        use {
          'filipdutescu/renamer.nvim',
          branch = 'master',
          requires = { { 'nvim-lua/plenary.nvim' } },
          config = function() require('lt.plugins.renamer') end
        }
        use 'onsails/lspkind-nvim'
        use 'ray-x/lsp_signature.nvim'
        use 'jose-elias-alvarez/nvim-lsp-ts-utils'
        use({
          'williamboman/nvim-lsp-installer',
          config = function() require("nvim-lsp-installer").settings { log_level = vim.log.levels.DEBUG } end
        })
        use {
          'github/copilot.vim',
          config = function() require('lt.plugins.copilot') end
        }

        use {
          'stevearc/aerial.nvim',
          config = function() require('lt.plugins.aerial') end
        }

        -- Snippets
        use({
            'L3MON4D3/LuaSnip',
            requires = {'rafamadriz/friendly-snippets'},
            config = function() require('lt.plugins.snippets') end
        })

        use ({
            'hrsh7th/nvim-cmp',
            config = function() require 'lt.plugins.nvim-cmp' end,
            event = 'InsertEnter'
        })

        use({'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'})

        use({'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'})

        use({'hrsh7th/cmp-buffer', after = 'nvim-cmp'})

        use({'hrsh7th/cmp-path', after = 'nvim-cmp'})

        use({'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'})

        use({
            'windwp/nvim-autopairs',
            after = 'nvim-cmp',
            config = function() require('lt.plugins.nvim-autopairs') end
        })

        use({
          'windwp/nvim-ts-autotag',
          config = function() require('nvim-ts-autotag').setup() end
        })

        -- Language packs
        use 'hashivim/vim-terraform'
        -- adds autodetection of some common jsonc files
        use 'kevinoid/vim-jsonc'

        use({
          "iamcco/markdown-preview.nvim",
          run = "cd app && yarn",
          setup = function() vim.g.mkdp_filetypes = { "markdown" } end, 
          ft = { "markdown" },
        })

        use {
            'nvim-treesitter/nvim-treesitter',
            config = function() require 'lt.plugins.treesitter' end,
            run = function() vim.cmd [[TSUpdate]] end
        }
        use 'nvim-treesitter/playground';

        use 'haringsrob/nvim_context_vt' -- shows treesitter context in end of parenthesis

        use 'RRethy/nvim-treesitter-textsubjects'
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        use {
            'andymass/vim-matchup', -- enhances %
            config = function() require 'lt.plugins.vim-matchup' end
        }

        use {
            'folke/todo-comments.nvim',
            config = function() require 'lt.plugins.todo-comments' end
        }

        use {
            'vuki656/package-info.nvim',
            config = function() require 'lt.plugins.package-info' end
        } -- shows latest version on package.json files

        use {
            'vhyrro/neorg',
            config = function() require 'lt.plugins.neorg' end,
            requires = {{'nvim-lua/plenary.nvim'}, {'nvim-neorg/neorg-telescope'}}
        }

        use {
            'folke/twilight.nvim',
            config = function() require 'lt.plugins.twilight' end
        }

        use {
            'Pocco81/TrueZen.nvim',
            config = function() require 'lt.plugins.truezen' end
        }

        -- Theming
        use 'gruvbox-community/gruvbox'

        -- status line
        use {
            'SmiteshP/nvim-gps',
            requires = 'nvim-treesitter/nvim-treesitter',
            config = function() require 'lt.plugins.nvim-gps' end
        }

        use {
            'NTBBloodbath/galaxyline.nvim',
            requires = 'SmiteshP/nvim-gps',
            config = function() require 'lt.plugins.galaxyline' end
        }
    end
}
