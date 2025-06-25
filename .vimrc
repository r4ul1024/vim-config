 " Подключаем vim-plug для управления плагинами
 call plug#begin('~/.vim/plugged')

 " Автокомплит через coc.nvim
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

 " Автоформатирование
 Plug 'Chiel92/vim-autoformat'

 " Поддержка языков
 Plug 'sheerun/vim-polyglot'

 " Файловый менеджер
 Plug 'preservim/nerdtree'

 " Статус-бар
 Plug 'vim-airline/vim-airline'

 " Темы
 Plug 'morhetz/gruvbox'
 Plug 'ayu-theme/ayu-vim'

 " Отступы
 Plug 'Yggdroot/indentLine'

 " Автозакрытие скобок
 Plug 'jiangmiao/auto-pairs'

 call plug#end()

 " Включаем подсветку
 syntax on
 filetype plugin indent on

 " Числа строк
 set number

 " Отступы и табы
 set tabstop=4
 set shiftwidth=4
 set expandtab
 set autoindent
 set smartindent
 set matchtime=2

 " Автоформат при сохранении
 autocmd BufWritePre * Autoformat

 " Настройки coc.nvim
 let g:coc_global_extensions = ['coc-clangd']

 inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

 " Быстрый вызов автодополнения
 inoremap <silent><expr> <C-Space> coc#refresh()

 " Цвета и тема
 set termguicolors
 set background=dark

 " === Выбор темы оформления ===
 let g:gruvbox_contrast_dark = 'hard'
 colorscheme gruvbox
 "let ayucolor = 'dark'
 "colorscheme ayu

 " Красивые линии отступов
 let g:indentLine_enabled = 1
 let g:indentLine_char = '¦'

 " Комлпит-опции
 set completeopt=menu,menuone,noinsert

 " Подсветка строки с курсором
 set cursorline

 " Горячие клавиши для NERDTree
 nnoremap <F2> :NERDTreeToggle<CR>
 nnoremap <C-n> :NERDTreeToggle<CR>

 " Навигация между окнами
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l

 " Автооткрытие NERDTree при старте
 autocmd VimEnter * NERDTree

 let g:NERDTreeMapOpenVSplit = 'v'
 let g:NERDTreeMapOpenSplit = 's'

 " Закрытие Vim, если остался только NERDTree
 autocmd bufenter * if (winnr('$') == 1 && &filetype == 'nerdtree') | quit | endif

 " Компиляция по F5
 nnoremap <F5> :w<CR>:call CompileRun()<CR>

 function! CompileRun()
     let file = expand('%:t')
     if file =~ '\.cpp$'
         !cmake --build build && ./build/app
     else
         echo "Unknown filetype"
     endif
 endfunction

 " Мышь
 set mouse=a

 " Буфер обмена
 set clipboard=unnamedplus

 " Копировать в системный буфер
 vnoremap <C-c> "+y
 nnoremap <C-v> "+p
 inoremap <C-v> <C-r>+
