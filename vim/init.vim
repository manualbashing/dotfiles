language en_US.utf8
set ff=unix

if has("win32") || has("win64")
	let windows=1
else
	let windows=0
endif

" Tells vim-plug where to install plugins.
if windows
	call plug#begin('C:\Users\m.batsching\AppData\Local\nvim\plugged\')
else
	call plug#begin('~/.config/nvim/plugged/')
endif

" Tells vim-plug where to download plugins.
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/gruvbox-community/gruvbox'
Plug 'https://github.com/epwalsh/obsidian.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-peekaboo'
" Tells vim-plug to stop looking for plugins.
call plug#end()

" Use Ins to insert
map! <S-Insert> <C-R>+
" Easy way to navigate panes
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Use windows Clipboard
set clipboard+=unnamedplus


" Appearance
colorscheme gruvbox
set number

" Remove background in terminal
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" Editing
"
set wrap
set linebreak " no wrapping in the middle of the word

" Behavior
set undofile " activate persistent undo
set hidden " allow open buffers in the background


" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

