call plug#begin('~/.config/nvim/plugged')

" Highlighting + Syntax
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-latex/vim-latex'
Plug 'dracula/vim'

" Git integration + File management
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-fugitive'

" Extra
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/goyo.vim'

call plug#end()

if executable('rg')
	let g:rg_derive_root='true'
endif

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_altv=1

let g:vimwiki_list = [{ 'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md' }]


let mapleader=' '
nnoremap j gj
nnoremap k gk
" Windowing
nnoremap <silent> <leader><leader> :wincmd w<CR>
nnoremap <silent> <leader>h	   :wincmd h<CR>
nnoremap <silent> <leader>j   	   :wincmd j<CR>
nnoremap <silent> <leader>k   	   :wincmd k<CR>
nnoremap <silent> <leader>l   	   :wincmd l<CR>
nnoremap <silent> <leader>s 	   :wincmd s<bar> :wincmd j<CR>
nnoremap <silent> <leader>v 	   :wincmd v<bar> :wincmd l<CR>
nnoremap <silent> <leader>= 	   :vert resize +5<CR>
nnoremap <silent> <leader>- 	   :vert resize -5<CR>
nnoremap <silent> <leader>+ 	   :resize +5<CR>
nnoremap <silent> <leader>_ 	   :resize -5<CR>
" Tabbing
nnoremap <silent> <c-h> :tabprevious<CR>
nnoremap <silent> <c-l> :tabnext<CR>
" File finding
nnoremap <silent> <leader>pv :Lex<CR>
nnoremap <silent> <leader>ps :Rg<CR>
nnoremap <silent> <c-p> :FZF<CR>
" Git
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gl :Gllog<CR>
nnoremap <silent> <leader>gc :Gbranches<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>mh :diffget //2<CR>
nnoremap <silent> <leader>ml :diffget //3<CR>



set nocompatible
filetype plugin on
syntax on

set mouse=nv
set exrc
set expandtab shiftwidth=4 tabstop=4 softtabstop=4 autoindent smartindent
set nu rnu
set incsearch ignorecase smartcase nohls
set noswapfile nobackup nowritebackup
set undodir=~/.config/nvim/undodir undofile

set scrolloff=8
set cmdheight=2
set hidden wildmenu

" Gruvbox
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_invert_selection='0'
let g:airline_theme='gruvbox'

set termguicolors
set background=dark
" colo dracula
colo gruvbox
set cursorline
hi! Normal ctermbg=NONE guibg=NONE

" COC Settings
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
