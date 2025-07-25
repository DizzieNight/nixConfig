require("telescope").setup({
    extensions = {
        undo = {

        },
    }
})
require("telescope").load_extension("flutter")
require("telescope").load_extension("undo")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")
local builtin = require('telescope.builtin')
local map = vim.keymap.set
map('n', '<leader>tt', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>tg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>tb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>th', builtin.help_tags, { desc = 'Telescope help tags' })
map('n', '<leader>to', builtin.oldfiles, { desc = 'Telescope old files' })
map('n', '<leader>tf', ':Telescope file_browser hidden=true no_ignore=true<CR>', { desc = 'Telescope file browser' })
map('n', '<leader>tp', ':Telescope project<CR>', { desc = 'Telescope swap projects' })
map('n', '<leader>ft', ':Telescope flutter commands<CR>', {desc = 'Flutter'})
map('n', '<leader>tu', ':Telescope undo<CR>', {desc = 'Undo History'})
-- map('n', '<leader>fa', ":lua require('telescope.builtin').find_files({cwd = "~"})")
-- map('n', '<leader>fa', builtin.find_files({ cwd = "~" }), { desc = 'Telescope find files' })
