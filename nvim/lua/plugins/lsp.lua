return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.enable("clangd")
      vim.lsp.config["clangd"] = {
        offsetEncoding = { "utf-8", "utf-16" },

        textDocument = {
          completion = {
            editsNearCursor = true
          }
        }
      }
      vim.lsp.enable("tinymist")
      vim.lsp.config["tinymist"] = {
        cmd = { "tinymist" },
        filetypes = { "typst" },
      }
      vim.lsp.enable("lua_ls")
      vim.lsp.config("lua_ls", { capabilities = capabilities })
      -- TODO: Confiigure pyright and ruff
      vim.lsp.enable("ruff")
      vim.lsp.config("ruff", { capabilities = capabilities })
      vim.lsp.enable("pylsp")
      vim.lsp.config("pylsp", {
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              mccabe = { enabled = false },
              pylsp_mypy = { enabled = false },
              pylsp_black = { enabled = false },
              pylsp_isort = { enabled = false }
            }
          }
        }
      })

      vim.lsp.enable("rust_analyzer")
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = false,
            }
          }
        }
      })


      vim.diagnostic.config({ virtual_text = true })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if not client then return end
          -- Auto-format ("lint") on save.
          -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
          if not client:supports_method('textDocument/willSaveWaitUntil')
              and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      })
    end,
  }
}
