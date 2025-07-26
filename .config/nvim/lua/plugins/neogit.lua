return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"sindrets/diffview.nvim"
		},
		config=function()
			local neogit = require('neogit')
			neogit.setup({})

			vim.keymap.set("n", "<leader>ng", neogit.open, {desc = "Open Neogit"})
		end
	},
	{
		"lewis6991/gitsigns.nvim",
		config=function()
			require("gitsigns").setup({})

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunks for git" })
			vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle line blame"})
		end
	}
}
