return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.checkstyle.with({
					args = { "-f", "sarif", "$ROOT/src" },
					extra_args = { "-c", "$ROOT/checkstyle.xml" }, -- or "/sun_checks.xml" or path to self written rules
				}),
			},
		})

	end,
}
