return {
	{
		"mrjones2014/smart-splits.nvim",
		config=function()
			local smart_splits = require('smart-splits')
			vim.keymap.set('n', '<A-h>', smart_splits.resize_left, {desc = "Resize Current split left [H]"})
			vim.keymap.set('n', '<A-j>', smart_splits.resize_down , {desc = "Resize Current split down [J]"})
			vim.keymap.set('n', '<A-k>', smart_splits.resize_up   , {desc = "Resize Current split up [K]"})
			vim.keymap.set('n', '<A-l>', smart_splits.resize_right, {desc = "Resize Current split right [L]"})
			--
			-- swapping buffers between windows
			vim.keymap.set('n', '<leader><leader>h', smart_splits.swap_buf_left, {desc = "Swap with left buffer "})
			vim.keymap.set('n', '<leader><leader>j', smart_splits.swap_buf_down, {desc = "Swap with buffer down"})
			vim.keymap.set('n', '<leader><leader>k', smart_splits.swap_buf_up, { desc = "Swap with buffer up"})
			vim.keymap.set('n', '<leader><leader>l', smart_splits.swap_buf_right, { desc = "Swap with right buffer"})

			-- moving between splits
			vim.keymap.set('n', '<C-\\>', smart_splits.move_cursor_previous, {desc = "Move to previous split"})
			vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left, { desc = 'Move focus to the left window' })
			vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right, { desc = 'Move focus to the right window' })
			vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down, { desc = 'Move focus to the lower window' })
			vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up, { desc = 'Move focus to the upper window' })

		end
	}
}
