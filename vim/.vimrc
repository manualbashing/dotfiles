set nocompatible              " be iMproved, required
filetype off                  " required

" Indentation
set shiftwidth=2
set expandtab "Convert tabs to spaces
set autoindent " New lines inherit the indentation of previous lines


" Search
set smartcase " Automatically switch search to case-sensitive when search query contains an uppercase letter.

" Text rendering
set display+=lastline " Always try to show a paragraph’s last line.
set encoding=utf-8 " Use an encoding that supports unicode.
set linebreak " Avoid wrapping a line in the middle of a word.
set scrolloff=1 " The number of screen lines to keep above and below the cursor.
set sidescrolloff=5 " The number of screen columns to keep to the left and right of the cursor.
syntax enable " Enable syntax highlighting.
set wrap " Enable line wrapping.

" Interface options
set cursorline " Highlight the line currently under cursor.
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

set noerrorbells " Disable beep on errors.
set mouse=a " Enable mouse for scrolling and resizing.
set title " Set the window’s title, reflecting the file currently being edited.
set background=dark " Use colors that suit a dark background.

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Use pathogen to load plugins from ~/.vim/bundle
execute pathogen#infect()
syntax on
filetype plugin indent on " Enable indentation rules that are file-type specific.

" Fuzzy Search Finder
source ~/.fzf/plugin/fzf.vim " Load Fuzzy Search Finder 
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""' " Include hidden files into search (requires ag-silverfinder)

" FloatTerm
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

hi Floaterm guibg=black
hi FloatermBorder guibg=orange guifg=cyan
let g:floaterm_wintype = 'float'

" Bindings for easymotion
map <Leader> <Plug>(easymotion-prefix)

"""""" MISC
set autoread " Automatically re-read files if unmodified inside Vim.
set backspace=indent,eol,start " Allow backspacing over indention, line breaks and insertion start.
set backupdir=$HOME/.vim/tmp// " Directory to store backup files.
set confirm " Display a confirmation dialog when closing an unsaved file.
set formatoptions+=j " Delete comment characters when joining lines.
set hidden " Hide files in the background instead of closing them.
set history=1000 " Increase the undo limit.
set directory^=$HOME/.vim/tmp// " Keep swp files in a central folder 
