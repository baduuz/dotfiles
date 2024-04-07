function ColorMe(theme)
    local theme = theme or 'kanagawa'
    vim.cmd.colorscheme('kanagawa')

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

return {
    { 'ellisonleao/gruvbox.nvim' },
    {
        'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000,

        config = function()
            require('kanagawa').setup {
                background = { dark = 'dragon' }
            }
            ColorMe('kanagawa')
        end,
    },
}
