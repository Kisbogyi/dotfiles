local global = vim.g
local o = vim.o

vim.scriptencoding = "utf-8"

o.number = true -- Print the line number in front of each line
o.undofile = true
o.undodir = "/home/bandi/.nvim/undodir"
o.relativenumber = true
o.wrap = false
o.colorcolumn = '80'
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.opt.splitright = true
vim.opt.splitbelow = true

