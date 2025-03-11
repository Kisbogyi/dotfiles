require("config.lazy")
require("settings")

vim.cmd.colorscheme "catppuccin-mocha"

-- use W command to save file with root
vim.api.nvim_create_user_command('W', function()
  vim.cmd('silent! write !sudo tee % > /dev/null')
  vim.cmd('edit!')
end, {})

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]
