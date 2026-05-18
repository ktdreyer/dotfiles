vim.opt.title = true

-- unclear if this actually works, per https://github.com/equalsraf/neovim-qt/issues/883
-- au UIAttach * ++once lua require('ginit')

-- Paste from system clipboard in Insert mode using Ctrl-Shift-V
vim.keymap.set('i', '<C-S-V>', '<C-r><C-o>+', { noremap = true, desc = 'Paste from clipboard' })

-- Optional: Also make it work in Normal mode and Command-line mode
vim.keymap.set('n', '<C-S-V>', '"+P', { noremap = true, desc = 'Paste from clipboard' })
vim.keymap.set('c', '<C-S-V>', '<C-r>+', { noremap = true, desc = 'Paste from clipboard' })
