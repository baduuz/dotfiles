return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',

    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { 'c', 'zig', 'java' },
            ignore_install = { 'latex' },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = { enable = true },
        }
    end,
}
