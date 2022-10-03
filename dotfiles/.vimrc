" Initialise vim_plug on start and sync
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'vim-syntastic/syntastic'
    Plug 'morhetz/gruvbox'
    Plug 'Shougo/neco-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'scrooloose/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

se encoding=utf-8
se cmdheight=2
se shortmess+=c
" Configure Syntastic Status line
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Configure COC
command! -nargs=0 Prettier :CocCommand prettier.formatFile

fu! COCGlobalExtentions(...) 
    " Automatically populate coc_global_extensions
    let g:coc_global_extensions = []
    for Extension in a:000
        if index(g:coc_global_extensions, Extension) == -1
            call insert(g:coc_global_extensions, Extension)
        endif
    endfor
    return g:coc_global_extensions
endf

fu! COCGlobalExtentionCount()
    " Conquer of Completion total extensions
    let Extensions = g:coc_global_extensions
    let ExtensionLength = str2nr(len(Extensions), 8)
    return ExtensionLength
endf

fu! AutoExpandExplorer(MinimumBuffers)
   " Enable NERDTree if buffer is not empty and greater than or equal to MinimumBuffers 
    let BufferPath = expand('%:p')
    let BufferLength = len(getbufinfo({'buflisted':1})) 
    if BufferPath != '' && BufferLength >= a:MinimumBuffers
        au VimEnter * NERDTree
    endif
endf 

call COCGlobalExtentions('coc-pairs', 'coc-tsserver','coc-eslint', 'coc-json', 'coc-python', 'coc-java', 'coc-sh', 'coc-git', 'coc-phpls')
call AutoExpandExplorer(2)

" QOL Features
" Horizontal and vertical highlighting for row & column, 0 transparency
hi CursorLine cterm=NONE ctermbg=0
hi CursorColumn cterm=NONE ctermbg=0

" Space and indentation
se relativenumber number ruler

se tabstop=4 softtabstop=4 shiftwidth=4
se autoindent smartindent copyindent expandtab

" Highlighting
se hlsearch incsearch showmatch 

" Mouse control
se mouse=a ttymouse=sgr
" User Keybinds

" Tab hopping
nnoremap <silent><C-Left> :tabprevious<CR>
nnoremap <silent><C-Right> :tabnext<CR>

" Tab creation
nnoremap <silent><C-T> :tabnew<CR>

" Tab (key) completion
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"

" Ignore case when searching unless case
se ignorecase smartcase

" Configure gruvbox theme
let g:gruvbox_italicize_strings='1'
let g:gruvbox_transparent_bg='1'
let g:gruvbox_bold='1'

se background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
