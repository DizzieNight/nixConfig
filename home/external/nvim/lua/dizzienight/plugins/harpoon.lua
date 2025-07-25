local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end ,{desc = "Harpoon Delete"})
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, {desc = "Harpoon Add"})
vim.keymap.set("n", "<A-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<A-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<A-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<A-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<A-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<A-S-N>", function() harpoon:list():next() end)
