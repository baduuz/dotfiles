-- thanks prime
-- https://github.com/ThePrimeagen/neovimrc/blob/master/lua/theprimeagen/init.lua

return {
    'tpope/vim-fugitive',

    config = function()
        vim.api.nvim_create_autocmd('BufWinEnter', {
            group = vim.api.nvim_create_augroup('FugitiveGroup', {}),
            callback = function()
                if vim.bo.ft ~= 'fugitive' then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set('n', '<leader>gp', function()
                    vim.cmd.Git('push')
                end, opts)

                vim.keymap.set('n', '<leader>gP', function()
                    vim.cmd.Git({ 'pull' })
                end, opts)
            end,
        })


        vim.keymap.set('n', '<leader>pg', vim.cmd.Git)
        vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>')
        vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>')
    end,
}
