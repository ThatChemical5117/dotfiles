require('neo-tree').setup({
	close_if_last_window = false,
	enable_diagnostics = true,
	enable_git_status = false,
	hijack_netrw_behavoir = "open_current"
})

vim.keymap.set('n', '<leader>da', function()
	require('neo-tree.command').execute({toggle = true})
	end,
	{ 
		desc = "Open Neotree"
	}
)

vim.keymap.set('n', '<leader>dw', function()
	require('neo-tree.command').execute({toggle = true, position = 'current'})
	end,
	{
		desc = "Open Neotree as full window"
	}
)
