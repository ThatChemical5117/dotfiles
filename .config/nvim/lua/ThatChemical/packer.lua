-- Function ensures that packer is installed on
-- the system that runs this configuration file
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  -- checks if packer is installed, clones packer if not
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- runs the function returns true if packer was bootstrapped
local packer_bootstrap = ensure_packer()

-- Packer packages configuration
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- smart splits
	use('mrjones2014/smart-splits.nvim')

	-- Color scheme
	use {
		'catppuccin/nvim',
		as = "catppuccin"
	}

	use 'akinsho/toggleterm.nvim'

	-- special markdown highlighting for Obsidian
	use 'preservim/vim-markdown'
	use 'vim-pandoc/vim-pandoc-syntax'

	-- Syntax highlighting
	use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	-- Harpoon
	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim"} }
	}

	-- obsidian
	use({
		"epwalsh/obsidian.nvim",
		tag = "*",
		requires = {
			"nvim-lua/plenary.nvim",
		}

	})

	-- telescope for quick finding
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim'},
			{ 'nvim-telescope/telescope-ui-select.nvim'},
			{ 'nvim-tree/nvim-web-devicons' },
		}
	}

	use {
		'NeogitOrg/neogit',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope.nvim'},
			{ 'sindrets/diffview.nvim'},
		}
	}
	--
	-- LSP for languages, managed by mason
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

	-- packer bootstrap code
	if packer_bootstrap then
		require('packer').sync()
	end

end)
