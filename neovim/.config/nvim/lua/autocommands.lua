vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('YankHighlight', {}),
    callback = function()
        vim.highlight.on_yank {
            higroup = 'IncSearch',
            timeout = 40,
        }
    end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
    group = vim.api.nvim_create_augroup('MyGroup', {}),
    command = [[%s/\s\+$//e]],
})
