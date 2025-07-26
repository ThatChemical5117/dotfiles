return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config=function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd"}
			})
		end
	},
	{
		"mfussenegger/nvim-jdtls",
	},
	{
		"neovim/nvim-lspconfig",
		config=function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})

			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,  {buffer = bfnr, remap = false, desc = "Go to definition"})
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,  {buffer = bfnr, remap = false, desc = "Hover"})
			vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,  {buffer = bfnr, remap = false, desc = "Workspace symbol"})
			vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,  {buffer = bfnr, remap = false, desc = "Diagnostic open"})
			vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,  {buffer = bfnr, remap = false, desc = "goto next diagnostic"})
			vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,  {buffer = bfnr, remap = false, desc = "goto previous diagnostic"})
			vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,  {buffer = bfnr, remap = false, desc = "open code actions"})
			vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,  {buffer = bfnr, remap = false, desc = "open references"})
			vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,  {buffer = bfnr, remap = false, desc = "rename function"})
			vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,  {buffer = bfnr, remap = false, desc = "signature help"})

		end
	},
}
