local neogit = require('neogit')

neogit.setup({})


vim.keymap.set("n", "<leader>ng", neogit.open)
