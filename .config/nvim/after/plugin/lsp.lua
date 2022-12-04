local nnoremap = require("baduuz.keymap").nnoremap
local inoremap = require("baduuz.keymap").inoremap
local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
	}),

	sources = {
		{ name = "nvim_lsp"},
		{ name = "path" },
		{ name = "buffer" , keyword_length = 5},
	},
})

--credit github.com/theprimeagen
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("gd", function() vim.lsp.buf.definition() end)
			nnoremap("gr", function() vim.lsp.buf.references() end)
			nnoremap("gi", function() vim.lsp.buf.implementation() end)
			nnoremap("[h", function() vim.diagnostic.open_float() end)
			nnoremap("[H", function() vim.diagnostic.setqflist() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			-- nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("[n", function() vim.diagnostic.goto_next() end)
			nnoremap("[N", function() vim.diagnostic.goto_prev() end)
			nnoremap("[f", function() vim.lsp.buf.code_action() end)
			nnoremap("[r", function() vim.lsp.buf.references() end)
			nnoremap("[F", function() vim.lsp.buf.formatting() end)
			-- nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

require("lspconfig").clangd.setup(config())
