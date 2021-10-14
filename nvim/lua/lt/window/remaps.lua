-- Use s instead of <C-w> to handle windows
nnoremap('s', '<C-w>', 'remap', 'remap_s', 'Remaps s to handle windows')

nnoremap('<leader>w+', '<cmd>vertical resize +5<CR>', 'window',
         'window_increase_size', 'Increase window size')
nnoremap('<leader>w-', '<cmd>vertical resize -5<CR>', 'window',
         'window_decrease_size', 'Decrease window size')
