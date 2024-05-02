require("catppuccin").setup({
	flavor = "mocha",
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

vim.cmd.colorscheme "catppuccin-mocha"
