return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'williamboman/mason.nvim',
        },
        config = function()
            local lspGroup = vim.api.nvim_create_augroup('LspGroup', {})

            vim.api.nvim_create_autocmd('LspAttach', {
                group = lspGroup,
                pattern = '*',
                callback = function(event)
                    local map = function(keys, func)
                        vim.keymap.set('n', keys, func, { buffer = event.buf })
                    end

                    map('gd', vim.lsp.buf.definition)
                    map('gD', vim.lsp.buf.declaration)
                    map('gr', vim.lsp.buf.references)
                    map('gI', vim.lsp.buf.implementation)
                    map('K', vim.lsp.buf.hover)
                    map('<leader>bd', vim.lsp.buf.type_definition)
                    map('<leader>bs', vim.lsp.buf.document_symbol)
                    map('<leader>br', vim.lsp.buf.rename)
                    map('<leader>ba', vim.lsp.buf.code_action)
                    vim.keymap.set('i', '<c-s>', vim.lsp.buf.signature_help, { buffer = event.buf })
                end
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            require('mason').setup()

            local lspconfig = require("lspconfig")

            lspconfig.zls.setup({ capabilities = capabilities })
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.jdtls.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
        end,
    },
}
