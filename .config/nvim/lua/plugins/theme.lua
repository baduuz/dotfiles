local function set_theme(theme)
	if theme == nil then
		theme = "tokyonight"
	end
	vim.cmd.colorscheme(theme)
--	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
--	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
end

return {
	{
		"ellisonleao/gruvbox.nvim",
	},
	{
		"folke/tokyonight.nvim",

		config = function()
			require("tokyonight").setup({
				style = "moon",
				-- transparent = true,
				-- tokyonight_dark_float = false,
			})
		end
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"rebelot/kanagawa.nvim",

		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				background = {
					dark = "dragon",
				}
			})
			set_theme("kanagawa")
		end,
	},
}
