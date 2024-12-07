return {
	"williamboman/mason-lspconfig",
	dependencies = {
		{"williamboman/mason.nvim", opts = {} },
		{'neovim/nvim-lspconfig' },
	},
	opts = {
		ensure_installed = {
			"lua_ls",
			"ruff",
			"rust_analyzer",
		},
		handlers = {
			function (server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup {}
			end,
           ["rust_analyzer"] = function ()
           end,

            require ("lspconfig").ruff.setup({
                trace = 'message',
                init_options = {
                    settings = {
                        logLevel = 'debug',
                    },
                },
                keys = {
                    "<leader>co"
                    
                }
            })
		},
	},
}
