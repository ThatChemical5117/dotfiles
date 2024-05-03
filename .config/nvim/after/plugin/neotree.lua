require('neo-tree').setup({
	close_if_last_window = false,
	enable_git_status = false,
	hijack_netrw_behavoir = "open_default"
})

vim.keymap.set('n', '<leader>da', ':Neotree<CR>', { desc = "Open Netrw"})
vim.keymap.set('n', '<leader>dw', ':Neotree position=current<CR>', {desc = "Open Netrw as full window"})
