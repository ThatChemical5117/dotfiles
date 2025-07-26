return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim"
		},

		config=function()
			require('neo-tree').setup({
				close_if_last_window = false,
				enable_diagnostics = true,
				enable_git_status = true,
				hijack_netrw_behavoir = "open_current"
			})

			vim.keymap.set('n','<leader>da', function()
				require('neo-tree.command').execute({toggle = true}) end,
				{ desc = "Open Neotree" })

			vim.keymap.set('n', '<leader>dw', function()
				require('neo-tree.command').execute({toggle = true, position = 'current'}) end,
				{ desc = "Open Neotree as full window"})
		end
	}
}
