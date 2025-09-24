return {
  {
    'stevearc/oil.nvim',
    opts = {
      columns = {
        "icon",
        -- "permissions",
        -- "mtime",
        -- "size",
      },
      skip_confirm_for_simple_edits = false,
      show_hidden = true,
      natural_order = "fast",
      case_insensitive = false,
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
      float = {
        padding = 0,
        border = "single"
      },
      keymaps_help = {
        padding = 0,
        border = "single",
      },
      highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
        return false
      end,
      --   Set always hidden files
      --   is_always_hidden = function(name, bufnr)
      --     return false
      --   end,
    },
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  }
}
