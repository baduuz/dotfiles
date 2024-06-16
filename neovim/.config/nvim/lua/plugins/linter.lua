return {
    'mfussenegger/nvim-lint',

    config = function()
        local lint = require('lint')
        local linters_by_ft = {
            sh = { 'shellcheck' },
            java = { 'checkstyle' },
        }

        lint.linters_by_ft = {}

        -- only add linters if they are found
        for ft, linters in pairs(linters_by_ft) do
            local used_linters = {}
            for _, linter in ipairs(linters) do
                local cmd = lint.linters[linter].cmd
                if vim.fn.executable(cmd) == 1 then
                    table.insert(used_linters, linter)
                end
            end
            if #used_linters > 0 then
                lint.linters_by_ft[ft] = used_linters
            end
        end

        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = vim.api.nvim_create_augroup('LintGroup', {}),
            callback = function() lint.try_lint() end,
        })

        -- custom configs
        lint.linters.checkstyle.config_file = 'checkstyle.xml'
    end
}
