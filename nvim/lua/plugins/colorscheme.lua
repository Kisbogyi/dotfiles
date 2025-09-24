return {
  -- the colorscheme should be available when starting Neovim
  "folke/tokyonight.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  style = "night",
  styles = {
    functions = {}
  },
  opts = {
    on_colors = function(colors)
      colors.bg = "#000000"
    end,
  },
}
