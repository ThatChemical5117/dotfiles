require("toggleterm").setup({
	direction = "float",
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_terminals = true,
	shell = vim.o.shell,
	auto_scroll = true,
})
