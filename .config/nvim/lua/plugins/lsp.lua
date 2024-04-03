return {
	{
		"williamboman/mason.nvim",

		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				lazy = false,
			},
		},

		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilites = capabilities })
			lspconfig.clangd.setup({ capabilites = capabilities })
			lspconfig.jdtls.setup({ capabilites = capabilities })
			lspconfig.zls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set({ "n", "i" }, "<C-h>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<leader>br", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, {})
		end,
	},
}
