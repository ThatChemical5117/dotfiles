require("obsidian").setup({
	workspaces = {
		{
			name = "MyVault",
			path = "~/Documents/NoteVault",
		},
	},

	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},

	new_notes_location = "notes_subdir",
	disable_frontmatter = true,

	note_id_func = function(title)
		return title
	end,

	templates = {
		subdir = "Templates",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
	},

	picker = {
		name = "telescope.nvim",

		new = "<C-S-X>",
		insert_link = "<C-l>",
	},

	ui = {
		enable = true,
	},
})

-- Obsidian Key maps
vim.keymap.set('n', '<leader>oo', ":ObsidianOpen <CR>", {desc = "[O]pen [O]bsidian"})
vim.keymap.set('n', '<leader>os', ":ObsidianQuickSwitch <CR>", {desc = "[O]bsidian Quick [S]witch"})
vim.keymap.set('n', '<leader>on', ":ObsidianNew Zettlekasten/", {desc = "Create new [O]bsidian [N]ote in Zettlekasten subdir"})
vim.keymap.set('n', '<leader>ot', ":ObsidianTemplate <CR>", {desc = "Use [O]bsidian [T]emplate"})
vim.keymap.set('n', '<leader>os', ":ObsidianSearch <CR>", {desc = "Bring up [O]bsidian [S]earch menu"})
vim.keymap.set('n', '<leader>of', ":ObsidianFollowLink <CR>", {desc = "Follow link"})


