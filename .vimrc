" Install vim_plug for nvim/vim "
" See: https://github.com/junegunn/vim-plug "

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Init vim-plug "
call plug#begin()
    Plug 'vim-syntastic/syntastic'
    Plug 'morhetz/gruvbox'
call plug#end()

" Configure statusline for Syntastic "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0"

" QOL Features "
set tabstop=4
set shiftwidth=4
set expandtab

" Configure gruvbox theme"
let g:gruvbox_contrast_light='hard'
let g:gruvbox_bold=1
let g:gruvbox_italicize_strings=1

set background=dark
colorscheme gruvbox
