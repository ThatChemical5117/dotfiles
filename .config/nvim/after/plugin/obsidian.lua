require("obsidian").setup({
	workspaces = {
		{
			name = "MyVault",
			path = "~/Documents/College/MyVault",
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

