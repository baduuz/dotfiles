local nnoremap = require("baduuz.keymap").nnoremap

nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")

nnoremap("<leader>s", ":wincmd s<bar> :wincmd j<CR>")
nnoremap("<leader>v", ":wincmd v<bar> :wincmd l<CR>")

nnoremap("<leader>pv", ":Lex<CR>")
