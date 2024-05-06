require("gitsigns").setup({})

vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk", { desc = "Preview hunks for git" })

