return {
  'chomosuke/typst-preview.nvim',
  lazy = false, -- or ft = 'typst'
  version = '1.*',
  opts = {
    invert_colors = 'never',
    debug = false,
    open_cmd = nil,
    vim.keymap.set('n', '<leader>p', ':TypstPreviewToggle<cr>', { desc = 'Telescope find files' })
  }, -- lazy.nvim will implicitly calls `setup {}`
}
