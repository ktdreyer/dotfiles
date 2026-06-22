vim.opt.title = true

-- unclear if this actually works, per https://github.com/equalsraf/neovim-qt/issues/883
-- au UIAttach * ++once lua require('ginit')

-- Paste from system clipboard in Insert mode using Ctrl-Shift-V
vim.keymap.set('i', '<C-S-V>', '<C-r><C-o>+', { noremap = true, desc = 'Paste from clipboard' })

-- Optional: Also make it work in Normal mode and Command-line mode
vim.keymap.set('n', '<C-S-V>', '"+P', { noremap = true, desc = 'Paste from clipboard' })
vim.keymap.set('c', '<C-S-V>', '<C-r>+', { noremap = true, desc = 'Paste from clipboard' })

-- Check where you were last time, ensure that line hasn't been deleted by an external program, and then put your cursor exactly where you left off.
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
