" Plug 'altercation/vim-colors-solarized'
  " let g:solarized_termcolors=256
Plug 'lifepillar/vim-solarized8'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" let g:solarized_termtrans = 1
fun! s:setTerminalColors()
 " Adapt the colors as you see fit
  let g:terminal_color_0='#073642'
  let g:terminal_color_1='#dc322f'
  let g:terminal_color_2='#859900'
  let g:terminal_color_3='#b58900'
  let g:terminal_color_4='#268bd2'
  let g:terminal_color_5='#d33682'
  let g:terminal_color_6='#2aa198'
  " Fix for filename color too light in Rg
  let g:terminal_color_7='#839496'
  " let g:terminal_color_7='#eee8d5'
  let g:terminal_color_8='#002b36'
  let g:terminal_color_9='#cb4b16'
  let g:terminal_color_10='#586e75'
  let g:terminal_color_11='#657b83'
  let g:terminal_color_12='#839496'
  let g:terminal_color_13='#6c71c4'
  let g:terminal_color_14='#93a1a1'
  let g:terminal_color_15='#fdf6e3'
endf
autocmd Colorscheme * call <sid>setTerminalColors()

