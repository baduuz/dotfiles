return {
    'mfussenegger/nvim-lint',

    config = function()
        local lint = require('lint')
        lint.linters_by_ft = {
            sh = { 'shellcheck' },
            java = { 'checkstyle' },
            python = { 'ruff' },
        }

        lint.linters.checkstyle.config_file = 'checkstyle.xml'

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = vim.api.nvim_create_augroup('LintGroup', {}),
            callback = function() lint.try_lint() end,
        })
    end
}
