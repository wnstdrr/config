" Initialise vim_plug "
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'vim-syntastic/syntastic'
    Plug 'morhetz/gruvbox'
call plug#end()

" Configure Syntastic "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" QOL Features "
" Horizontal and vertical highlighting for row & column "
hi CursorLine cterm=NONE ctermbg=0
hi CursorColumn cterm=NONE ctermbg=0
nnoremap <Leader>c :set cursorline! cursorcolumn<CR>


" Space and indentation "
set tabstop=4
set softtabstop=4
set expandtab 
set shiftwidth=4
set autoindent
set copyindent
set smartindent


" Highlighting "
set hlsearch
set incsearch
set showmatch


" Ignore case when searching unless case "
set ignorecase
set smartcase


" Configure gruvbox theme"
let g:gruvbox_transparent_bg='1'
let g:gruvbox_bold='1'
let g:gruvbox_italicize_strings='1'

set background=dark
colorscheme gruvbox

hi Normal guibg=NONE ctermbg=NONE
