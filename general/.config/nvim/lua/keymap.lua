-- Stuff
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Window movement
vim.keymap.set("n", "<leader>h", function() vim.cmd.wincmd('h') end)
vim.keymap.set("n", "<leader>j", function() vim.cmd.wincmd('j') end)
vim.keymap.set("n", "<leader>k", function() vim.cmd.wincmd('k') end)
vim.keymap.set("n", "<leader>l", function() vim.cmd.wincmd('l') end)
vim.keymap.set("n", "<leader>v", function()
    vim.cmd.wincmd('v')
    vim.cmd.wincmd('l')
end)
vim.keymap.set("n", "<leader>s", function()
    vim.cmd.wincmd('s')
    vim.cmd.wincmd('j')
end)

-- File Browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Lex)

-- Diagnostics
vim.keymap.set("n", "[f", vim.diagnostic.open_float)
vim.keymap.set("n", "[F", vim.diagnostic.setloclist)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
