return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "python", "rust" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
    })
  end
}
