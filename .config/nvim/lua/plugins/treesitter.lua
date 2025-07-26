return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { "c", "lua", "vim", "vimdoc", "cpp", "diff", "bash" },
				sync_install = true,

				auto_install = true,
				ingore_install = { "markdown", "markdown_inline"},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					disable = { "markdown", "markdown_inline"},
				}
			}
		end
	}
}
