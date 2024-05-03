vim.opt_local.textwidth = 100

if vim.g.tex_no_math ~= nil then
    vim.call('TexNewMathZone', { 'E', 'align', 1 })
end
