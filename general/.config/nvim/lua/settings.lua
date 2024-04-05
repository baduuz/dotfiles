-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Spaces > Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Searching
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Undofiles
vim.opt.swapfile = false
vim.opt.undofile = true

-- Some visual stuff
vim.opt.termguicolors = true
vim.opt.cmdheight = 2
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"
vim.opt.showmode = true
vim.opt.wrap = false
vim.opt.scrolloff = 8


-- Netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 25

-- Misc
vim.opt.mouse = ""
vim.opt.updatetime = 50

-- Diagnostics
vim.diagnostic.config({
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
