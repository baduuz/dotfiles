function ColorMe(theme)
    theme = theme or 'kanagawa'
    vim.cmd.colorscheme(theme)

    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
    {
        'ellisonleao/gruvbox.nvim',

        priority = 1000,
        config = function()
            require('gruvbox').setup {
                contrast = 'hard',
            }
            ColorMe('gruvbox')
        end,
    },
    {
        'rebelot/kanagawa.nvim',
    },
}
