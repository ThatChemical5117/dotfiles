vim.g.mapleader = " "

vim.keymap.set('n', '<Enter>', '<cmd>nohlsearch<CR>', {desc = "Clear Search"})
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>:bd!<CR>', {desc = "Exit Terminal"})
vim.keymap.set("n", "<leader>lf", vim.cmd.Lf, {desc = 'Open [L]ist [Files] (LF)'})
vim.keymap.set("n", "<leader>f", vim.cmd.Ex, {desc = "Open Netrw [F]ile manager"})

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

