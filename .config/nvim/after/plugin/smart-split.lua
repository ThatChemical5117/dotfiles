local SmartSplit = require('smart-splits')

vim.keymap.set('n', '<A-h>', SmartSplit.resize_left, {desc = "Resize Current split left [H]"})
vim.keymap.set('n', '<A-j>', SmartSplit.resize_down , {desc = "Resize Current split down [J]"})
vim.keymap.set('n', '<A-k>', SmartSplit.resize_up   , {desc = "Resize Current split up [K]"})
vim.keymap.set('n', '<A-l>', SmartSplit.resize_right, {desc = "Resize Current split right [L]"})
--
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', SmartSplit.swap_buf_left, {desc = "Swap with left buffer "})
vim.keymap.set('n', '<leader><leader>j', SmartSplit.swap_buf_down, {desc = "Swap with buffer down"})
vim.keymap.set('n', '<leader><leader>k', SmartSplit.swap_buf_up, { desc = "Swap with buffer up"})
vim.keymap.set('n', '<leader><leader>l', SmartSplit.swap_buf_right, { desc = "Swap with right buffer"})

-- moving between splits
vim.keymap.set('n', '<C-\\>', SmartSplit.move_cursor_previous, {desc = "Move to previous split"})
vim.keymap.set('n', '<C-h>', SmartSplit.move_cursor_left, { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', SmartSplit.move_cursor_right, { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', SmartSplit.move_cursor_down, { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', SmartSplit.move_cursor_up, { desc = 'Move focus to the upper window' })
