-- Split navigation
nnoremap('<C-h>', '<C-w>h', 'remap', 'remap_<C-h>', 'Remaps <C-h> to handle windows')
nnoremap('<C-j>', '<C-w>j', 'remap', 'remap_<C-j>', 'Remaps <C-j> to handle windows')
nnoremap('<C-k>', '<C-w>k', 'remap', 'remap_<C-k>', 'Remaps <C-k> to handle windows')
nnoremap('<C-l>', '<C-w>l', 'remap', 'remap_<C-l>', 'Remaps <C-l> to handle windows')

nnoremap('<leader>w+', '<cmd>vertical resize +5<CR>', 'window',
         'window_increase_size', 'Increase window size')
nnoremap('<leader>w-', '<cmd>vertical resize -5<CR>', 'window',
         'window_decrease_size', 'Decrease window size')
