return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config=function()
			require("catppuccin").setup({
				flavor = "auto",
				background = {
					light = "macchiato",
					dark = "mocha"
				},
				term_colors = false,
				transparent_background = true,
				default_integrations = true,
				integrations = {
					cmp = true,
					treesitter = true,
					harpoon = true,
					markdown = true,
					mason = true,
					neogit = true,
					telescope = {
						enabled = true,
					},
				},
			})

			vim.cmd.colorscheme "catppuccin"

		end
	}
}
