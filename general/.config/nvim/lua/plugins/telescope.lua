return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make'
        },
    },

    config = function()
        require('telescope').setup {
            extensions = {
                ['ui-select'] = { require('telescope.themes').get_dropdown {}, },
            },
        }
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('ui-select')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pp', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
    end,
}
