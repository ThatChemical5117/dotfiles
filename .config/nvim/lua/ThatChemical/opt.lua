-- Base Neovim configurations
-- Use for vanilla experience

-- Tab config
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth=4
vim.opt.expandtab = false
vim.opt.smartcase = true

-- file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- buffer settings
vim.opt.incsearch = true
vim.opt.errorbells = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.guicursor = "v:block,n-c-i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.scrolloff = 8
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'nosplit'
vim.opt.conceallevel = 2

-- GUI options
vim.g.have_nerd_font = true
vim.opt.termguicolors = true

-- Spelling
vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.filetype.add({
	pattern = {
		[".*/hyprland%.conf"] = "hyprlang",
		[".*/hypr/conf/*%.conf"] = "hyprlang"
	},
})
