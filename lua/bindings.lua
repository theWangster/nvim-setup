vim.g.mapleader = ' '
vim.keymap.set('n', '<C-s>', '<cmd>write<cr>', { desc = 'Save' })
vim.keymap.set({ 'n', 'v' }, '<leader>s', '<cmd>Explore<cr>', { desc = 'Show Filetree' })
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVGy<cr>', { desc = 'Copy All' })
-- vim.keymap.set({'n', 'x'}, 'x', '_x')
-- vim.keymap.set({'n', 'x'}, 'X', '_d')
