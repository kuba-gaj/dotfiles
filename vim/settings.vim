"===========================================================
" SETTINGS
"===========================================================

" Enable syntax highlighting.
"
syntax on

" General vim settings.
"
set autoindent        " Indented text
set autoread          " Pick up external changes to files
set autowrite         " Write files when navigating with :next/:previous
set backspace=indent,eol,start
set belloff=all       " Bells are annoying
set breakindent       " Wrap long lines *with* indentation
set breakindentopt=shift:2
if has("unnamedplus")
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set colorcolumn=81,82 " max line length=80
set conceallevel=0 " no hiding of characters
set complete=.,w,b
set completeopt=menu,menuone,noselect,noinsert
set dictionary=/usr/share/dict/words
set expandtab         " Convert tab to space
set foldlevelstart=20
set foldmethod=indent " Simple and fast
set foldtext=""
set formatoptions=cq
set gdefault          " Always do global substitutes
set history=200       " Keep 200 changes of undo history
set infercase         " Smart casing when completing
set ignorecase        " Search in case-insensitively
set incsearch         " Go to search results immediately
set laststatus=2      " We want a statusline
set matchpairs=(:),{:},[:]
set mouse=a           " Mouse support in the terminal
set mousehide         " Hide mouse when typing text
set nobackup          " No backup files
set nocompatible      " No Vi support
set noexrc            " Disable reading of working directory vimrc files
set nohlsearch        " Don't highlight search results by default
set nojoinspaces      " No to double-spaces when joining lines
set noshowcmd         " No to showing command in bottom-right corner
set noshowmatch       " No jumping jumping cursors when matching pairs
set noshowmode        " No to showing mode in bottom-left corner
set noswapfile        " No backup files
set nowrapscan        " Don't wrap searches around
set number            " Show line numbers
set nrformats=        " No to oct/hex support when doing CTRL-a/x
set path=**
set pumheight=20      " Height of complete list
" Ruby performance is terrible with regexpengine=2, see:
"   https://github.com/vim/vim/issues/282
"   https://github.com/vim-ruby/vim-ruby/issues/243
set regexpengine=2
set relativenumber    " Show relative numbers
set ruler
set shiftwidth=2      " indent size in normal mode, same as softtabstop
set showbreak=↳       " Use this to wrap long lines
set smartcase         " Case-smart searching
set smarttab
set splitbelow        " Split below current window
set splitright        " Split window to the right
set softtabstop=-1    " Number of spaces to replace tab with, -1=shiftwidth
set synmaxcol=250     " Only syntax highlight first 250 chars (for performance)
set t_Co=256          " 256 color support
set tabstop=2         " width of <tab>
" Be aware, termguicolors results in `:terminal` colors that are slightly off.
"   https://github.com/neovim/neovim/issues/7018
if has("termguicolors")
    set termguicolors " Enable 24-bit color support if available
endif
set textwidth=80
set timeoutlen=1500   " Give some time for multi-key mappings
" Don't set ttimeoutlen to zero otherwise it will break terminal cursor block
" to I-beam and back functionality set by the t_SI and t_EI variables below.
set ttimeoutlen=10
set ttyfast
" Set the persistent undo directory on temporary private fast storage.
" let s:undodir="/tmp/.undodir_" . $user
" if !isdirectory(s:undodir)
"     call mkdir(s:undodir, "", 0700)
" endif
" let &undodir=s:undodir
set undofile          " Maintain undo history
set updatetime=1000
set viminfo=          " No backups
set wildcharm=<Tab>   " Defines the trigger for 'wildmenu' in mappings
set wildmenu
set wildmode=full
set wrap              " Wrap long lines

" Certain options only work in Neovim whilst others only work in Vim.
" Neovim has a Whitespace highlight group, Vim does not.
if has("nvim")
    set inccommand=nosplit
    set nolist " show/no show invisibles
    set listchars=tab:\ \ ,trail:- " invisible chars to show
else
    set cryptmethod=blowfish2
    set listchars=eol:$,tab:>-,trail:-
    set ttymouse=xterm2
endif

