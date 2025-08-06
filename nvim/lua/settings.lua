local global = vim.g

local o = vim.o

vim.scriptencoding = "utf-8"

o.number = true -- Print the line number in front of each line
o.undofile = true
o.undodir = '/home/andras/.nvim/undodir'
o.relativenumber = true
o.wrap = false
o.colorcolumn = '80'
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>gd', require('telescope.builtin').lsp_definitions)
vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references)
vim.keymap.set('n', '<leader>gI', require('telescope.builtin').lsp_implementations)
vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions)
vim.keymap.set('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols)
vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration)

vim.keymap.set('n', '<leader>-', vim.cmd.Oil)


vim.api.nvim_set_keymap('t', '<leader>\\', [[<C-\><C-n>]], { noremap = true })

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.diagnostic.config { virtual_lines = true }
