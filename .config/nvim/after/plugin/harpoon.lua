local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({})
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "[A]dd to harpoon"})
vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end, { desc = "[R]emove all "})

vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open [H]arpoon quick menu"})


vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon [P]revious"})
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harppon [N]ext"})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Op[E]n harpoon window" })
