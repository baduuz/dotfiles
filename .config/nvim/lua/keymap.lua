local function nnoremap(key, fun)
	vim.keymap.set("n", key, fun, { noremap = true })
end

-- Window movement
nnoremap("<leader>h", function() vim.cmd ":wincmd h" end)
nnoremap("<leader>j", function() vim.cmd ":wincmd j" end)
nnoremap("<leader>k", function() vim.cmd ":wincmd k" end)
nnoremap("<leader>l", function() vim.cmd ":wincmd l" end)
nnoremap("<leader>v", function() vim.cmd ":wincmd v" vim.cmd ":wincmd l" end)
nnoremap("<leader>s", function() vim.cmd ":wincmd s" vim.cmd ":wincmd j" end)
nnoremap("<leader>=", function() vim.cmd ":wincmd =" end)

-- File Browser
nnoremap("<leader>pv", function() vim.cmd ":Lex" end)

-- Diagnostics
nnoremap("[h", vim.diagnostic.open_float)
nnoremap("[[", function() vim.diagnostic.goto_next() end)
nnoremap("[{", function() vim.diagnostic.goto_prev() end)
