-- set color scheme from plugin
require('ayu').colorscheme() 

-- set background transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})


