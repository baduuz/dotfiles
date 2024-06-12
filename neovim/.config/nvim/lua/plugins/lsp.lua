return {
    'neovim/nvim-lspconfig',

    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('LspGroup', {}),
            pattern = '*',
            callback = function(event)
                local map = function(mode, keys, func)
                    vim.keymap.set(mode, keys, func, { buffer = event.buf })
                end

                map('n', 'gd', vim.lsp.buf.definition)
                map('n', 'gD', vim.lsp.buf.declaration)
                map('n', 'gr', vim.lsp.buf.references)
                map('n', 'gI', vim.lsp.buf.implementation)
                map('n', 'K', vim.lsp.buf.hover)
                map('n', '<leader>bd', vim.lsp.buf.type_definition)
                map('n', '<leader>bs', vim.lsp.buf.document_symbol)
                map('n', '<leader>br', vim.lsp.buf.rename)
                map('n', '<leader>ba', vim.lsp.buf.code_action)
                map('n', '<leader>bf', vim.lsp.buf.format)
                map('i', '<c-s>', vim.lsp.buf.signature_help)
            end
        })


        local lspconfig = require('lspconfig')
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        local servers = {
            zls = {},
            lua_ls = { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } },
            clangd = {},
            gopls = {},
            templ = {},
            ocamllsp = {},
            rust_analyzer = {},
        }

        for server, config in pairs(servers) do
            config = vim.tbl_deep_extend('force', { capabilities = capabilities }, config)
            lspconfig[server].setup(config)
        end
    end,
}
