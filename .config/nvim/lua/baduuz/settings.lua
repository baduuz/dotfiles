vim.opt.mouse = "nv"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("XDG_CONFIG_HOME") .. "/nvim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true
vim.opt.cmdheight = 2
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"

vim.opt.hidden = true
vim.opt.wildmenu = true

vim.opt.updatetime = 50

vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

vim.g.mapleader = " "

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
