local options = {
  showmatch = true,
  -- nohlsearch
  hidden = true,
  errorbells = false,

  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  smarttab = true,
  wrap = true,

  -- absolute line number
  number = true,
  relativenumber = false,

  ignorecase = true, -- needed for smartcase to work
  smartcase = true,
  swapfile = false,
  backup = false,
  -- if vim.fn.isdirectory(undodir) == 0 then
    -- vim.fn.mkdir(undodir, 'p')
  -- end
  -- undodir = '/home/kuba/.nvim/undodir'
  undofile = true,
  incsearch = true,
  termguicolors = true,
  scrolloff = 8,

  -- live preview of substitutions
  inccommand = 'split',
  -- global search as default
  gdefault = true,

  -- Give more space for displaying messages.
  cmdheight = 1,

  -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  -- delays and poor user experience.
  updatetime = 50,

  -- Set completeopt to have a better completion experience
  -- :help completeopt
  -- menuone: popup even when there's only one match
  -- noinsert: Do not insert text until a selection is made
  -- noselect: Do not select, force user to select one from the menu
  completeopt = 'menu,menuone,noselect',


  -- colorcolumn=80

  -- lsp column & git column
  signcolumn = 'yes:2',
  -- signcolumn = 'number'


  cursorline = false,
  cursorcolumn = false,

  -- done by status bar
  showmode = false,

  -- shows spaces
  list = true,
  listchars= 'eol:¬,tab:>·,trail:~,extends:>,precedes:<',

  -- session options
  sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal",

  -- mouse support
  mouse = 'a',

  linebreak = true,
  showbreak = '↳', -- Use this to wrap long lines

  -- more natural split opening
  splitbelow = true,
  splitright = true,

  guifont = 'Operator Mono SSm Lig Book:h13',
  title = false,
  lazyredraw = false,

  -- global statusline
  laststatus = 3,

}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- disable netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.g.loaded_matchparen = 1
vim.g.mapleader = ' '

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append("c");

vim.o.foldlevelstart = 99; -- start file with all folds opened
vim.wo.foldcolumn = '0'; -- defines 1 col at window left, to indicate folding
-- using treesitter for folding
vim.wo.foldmethod = 'expr';
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()';
-- neovide
-- vim.g.neovide_refresh_rate = 60;
-- vim.g.neovide_cursor_animation_length = 0;
-- vim.g.neovide_cursor_trail_length = 0;
-- vim.g.neovide_cursor_animate_command_line = 0;
vim.g.neovide_cursor_antialiasing = 1;
-- vim.g.neovide_no_idle = 1;
-- vim.g.neovide_transparency=0.3;
