-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorschemes
	use 'gruvbox-community/gruvbox'

	use 'norcalli/nvim-colorizer.lua'
	
	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/nvim-cmp'

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

	use 'vim-airline/vim-airline'

	-- Git
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

	--other
	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'tikhomirov/vim-glsl'
	use 'junegunn/goyo.vim'
	use 'junegunn/limelight.vim'
	use 'davidbeckingsale/writegood.vim'

	use {
		'vimwiki/vimwiki',
		config = function ()
			vim.g.vimwiki_list = {
				{path = '~/Documents/brain/', syntax = 'markdown', ext = '.md', auto_tags = 1}
			}
		end
	}
end)
