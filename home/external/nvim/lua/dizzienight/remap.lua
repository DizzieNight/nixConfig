local map = vim.keymap.set

vim.g.mapleader = " "

-- Map semi colon to full colon for ease of use
map("n", ";", ":")

-- Set Ctrl+n to toggle Neotree
map('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Shortcut for :q
map('n', '<A-q>', ':q!<CR>')

-- Navigate between windows using Ctrl + h/j/k/l
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Move to the start of the line with Ctrl + a
map('n', '<C-a>', '0', { noremap = true, silent = true })
-- Move to the end of the line with Ctrl + e
map('n', '<C-e>', '$', { noremap = true, silent = true })

-- Use Ctrl+s to save
map('n', '<C-s>', ':w<CR>')

-- Use Tab to go to next buffer
map('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
-- Use Shift+Tab to go to previous buffer
map('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })
-- Close buffer
map('n', '<leader>z', ':bd<CR>', {desc = "Close Buffer", noremap = true, silent = true})
-- Open new buffer
map('n', '<leader>b', ':enew<CR>', {desc = "New Buffer", noremap = true, silent = true})


-- Window splittinh
-- Vertical split
map('n', '<leader>vh', ':split<CR>', { desc = "Horizontal Split", noremap = true, silent = true})
-- Horizontal split
map('n', '<leader>vv', ':vsplit<CR>', { desc = "Vertical Split", noremap = true, silent = true})

-- Indent whole file
map('n', '<leader>>', 'gg=G<Cr>', {desc = "Auto-Indent File", noremap = true, silent = true})
