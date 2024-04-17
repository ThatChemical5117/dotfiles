vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- smart splits
	use('mrjones2014/smart-splits.nvim')

	-- lf integration
	use { 
		'ptzz/lf.vim',
		requires = { { 'voldikss/vim-floaterm' } }
	}

	-- Color scheme
	use 'Shatur/neovim-ayu'

	-- Syntax highlighting
	use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	-- Git integration
 	use  'tpope/vim-fugitive'

	-- Harpoon
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim"} }
	}

	use 'ThePrimeagen/vim-be-good'

	-- LSP for some languages, managed by mason
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{ 'neovim/nvim-lspconfig'},
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim'},

			{ 'hrsh7th/nvim-cmp'},
			{ 'hrsh7th/cmp-nvim-lsp'},
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'L3MON4D3/LuaSnip'},
			{ 'rafamadriz/friendly-snippets' },
		}
	}

	-- telescope for quick finding
	use { 
		'nvim-telescope/telescope.nvim',
		requires = { { 
			'nvim-lua/plenary.nvim', 
			'nvim-telescope/telescope-ui-select.nvim', 
			'nvim-tree/nvim-web-devicons' 
		} }
	}

end)
