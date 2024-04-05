local yankGroup = vim.api.nvim_create_augroup('YankHighlight', {})
vim.api.nvim_create_autocmd('TextYankPost', {
	group = yankGroup,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

local myGroup = vim.api.nvim_create_augroup('MyGroup', {})
vim.api.nvim_create_autocmd('BufWritePre', {
    group = myGroup,
    pattern = '*',
    command = [[%s/\s\+$//e]],
})
