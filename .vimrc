" Load vim-plug for plugin management
call plug#begin('~/.vim/plugged')

" Autocompletion via coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Auto-formatting
Plug 'Chiel92/vim-autoformat'

" Language support
Plug 'sheerun/vim-polyglot'

" File manager
Plug 'preservim/nerdtree'

" Status bar
Plug 'vim-airline/vim-airline'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

" Indentation guides
Plug 'Yggdroot/indentLine'

" Auto-pair brackets
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Enable syntax highlighting and indentation
syntax on
filetype plugin indent on

" Line numbers
set number

" Tabs and indentation
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set matchtime=2

" Auto-format on save
autocmd BufWritePre * Autoformat

" coc.nvim settings
let g:coc_global_extensions = ['coc-clangd']

" Confirm autocomplete with Enter
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Trigger autocomplete with Ctrl+Space
inoremap <silent><expr> <C-Space> coc#refresh()

" Colors and theme
set termguicolors
set background=dark

" === Theme selection ===
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
"let ayucolor = 'dark'
"colorscheme ayu

" Indentation lines
let g:indentLine_enabled = 1
let g:indentLine_char = '¦'

" Completion options
set completeopt=menu,menuone,noinsert

" Highlight current line
set cursorline

" NERDTree hotkeys
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Auto open NERDTree on start
autocmd VimEnter * NERDTree

let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapOpenSplit = 's'

" Auto quit Vim if only NERDTree is left
autocmd bufenter * if (winnr('$') == 1 && &filetype == 'nerdtree') | quit | endif

" Compile with F5
nnoremap <F5> :w<CR>:call CompileRun()<CR>

function! CompileRun()
    let file = expand('%:t')
    if file =~ '\.cpp$'
        !cmake --build build && ./build/app
    else
        echo "Unknown filetype"
    endif
endfunction

" Enable mouse support
set mouse=a

" Use system clipboard
set clipboard=unnamedplus

" Copy to system clipboard
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v> <C-r>+
