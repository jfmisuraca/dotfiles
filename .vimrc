" Leader remap
let mapleader = " "
" desactivar el resaltado de resultado de búsqueda hasta que vuelva a usarse
nnoremap <Leader>h :nohlsearch<CR>
noremap <leader>g :Goyo<CR>
nnoremap <silent> <Leader>f :NV<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Ir al indice de zettelkasten
nnoremap <leader>i :e $zettelkasten/Indice\ glosario\ cheatsheet.md<CR>:cd $zettelkasten<CR>
" Centrar cursor verticalmente al moverse por resultados de búsqueda
nnoremap n nzz
nnoremap N Nzz
"html luke
autocmd FileType html inoremap <c-Space> <Esc>/<++><Enter>"_c4l
autocmd FileType html nnoremap <c-Space> <Esc>/<++><Enter>"_c4l
autocmd FileType html inoremap <leader>i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap <leader>b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap <leader>p <p></p><Space><++><Esc>FpT>i

" navegación con guías
inoremap <c-Space> <Esc>/<++><Enter>"_c4l
nnoremap <c-Space> <Esc>/<++><Enter>"_c4l

" forzar guardado con permisos root
cmap w!! w !sudo dd of=%<Enter>

" Goyo para redactar mails en neomutt
autocmd BufRead,BufNewFile /tmp/neomutt* Goyo
"autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=110

" Ejecutar xrdb cuando se edita Xresources
autocmd BufWritePost ~/.Xresources !xrdb %

set splitbelow splitright
set nocompatible

" Numeros de linea hibridos
:set number relativenumber

" Install vim-plug if not found - borrar si tarda mucho en iniciar
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
            \| endif


" configuracion de directorio de swap files
set directory=$HOME/.vim/swp// 

" plugins
call plug#begin()
"" Goyo
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimwiki/vimwiki'
Plug 'farmergreg/vim-lastplace'
Plug 'alok/notational-fzf-vim'
Plug 'BurntSushi/ripgrep'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'jamessan/vim-gnupg'
Plug 'dylanaraps/wal.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'rose-pine/vim'
Plug 'sainnhe/gruvbox-material'
Plug 'ledger/vim-ledger'
call plug#end()

set encoding=UTF-8

if has('termguicolors')
    set termguicolors
endif

set background=dark
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

" configuracion para ledger
let g:ledger_maxwidth = 80
let g:ledger_fillstring = '    -'

" colorscheme wal

" Plugins settings

" Goyo + limelight (focus mode)
let g:goyo_width = 110
let g:limelight_default_coefficient = 0.7
let g:limelight_conceal_ctermfg = 'Gray'

let g:vimwiki_list = [{'path': '~/Dropbox/Documentos/Obsidian/Zettelkasten/', 'syntax':'markdown', 'ext': '.md' }]
autocmd FileType vimwiki set ft=markdown


" activar script de tildes
so /home/francisco/Dropbox/Aplicaciones/scripts/tildes.vim

" indentar todo el documento y volver el cursor a la posición anterior
nnoremap <leader>= gg=G``

" Enable type file detection. Vim will be able to try to detect the type of file in use
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin indent on

" Turn syntax highlighting on
syntax on

" Ignore capital letters during search
set ignorecase
" Override the ignorecase option if searching for capital letters
set smartcase

" Show partial command you type in the last line of the screen
set showcmd

" Show the mode you are on the last line
set showmode

" Show matching words during a search
set showmatch

" Use highlighting when doing a search
set hlsearch

" sintaxis de bloques de código en archivos markdown
let g:markdown_fenced_languages = ['html', 'js=javascript', 'css', 'bash']

" limitar la paleta a 16 colores para que la busque en .Xresources
"set t_Co=16

" Correccion ortografica
"set spell spelllang=es_ar
"set spell spelllang=en_us

" ajusta la longitud de las líneas a la pantalla en vimdiff
au VimEnter * if &diff | execute 'windo set wrap' | endif
set linebreak

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:nv_search_paths = ['~/Dropbox/Documentos/Obsidian/Zettelkasten/Inbox', '~/Dropbox/Documentos/Obsidian/Zettelkasten']

"" variable con ubicación del archivo de zettelkasten
"let g:zettelkasten = '/home/francisco/Dropbox/Documentos/Obsidian/Zettelkasten'
"
"" comando para crear nuevo zettel y su atajo
"command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
"nnoremap <leader>nz :NewZettel

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set backspace   =indent,eol,start  " Make backspace work as you would expect.
set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.
"set laststatus  =2         " Always show statusline.
"set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
    let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
    let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

if &shell =~# 'fish$'
    set shell=/bin/bash
endif

set backup
set backupdir   =$HOME/.vim/files/backup//
set backupext   =-vimbackup
set backupskip  =
    set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo//
set clipboard=unnamed,unnamedplus
