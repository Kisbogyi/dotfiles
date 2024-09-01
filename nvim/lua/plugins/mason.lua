return {
	"williamboman/mason-lspconfig",
	dependencies = {
		{"williamboman/mason.nvim", opts = {} },
			'neovim/nvim-lspconfig',
	},
	opts = {
		ensure_installed = { 
			"lua_ls",
			"ruff_lsp",
		},
		handlers = {
			function (server_name) -- default handler (optional)
				require("lspconfig")[server_name].setup {}
			end,
		},
	},
}
