"============================================
"
"
"     ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"     ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"     ██║   ██║██║██╔████╔██║██████╔╝██║     
"     ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"   ██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"
"============================================

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
    " Conquer of Completion populate coc_global_extensions
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

call COCGlobalExtentions('coc-pairs', 'coc-tsserver','coc-eslint', 'coc-json', 'coc-python', 'coc-java', 'coc-sh', 'coc-git', 'coc-phpls', 'coc-ccls')
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


" OPTIONAL COC CONFIG BELOW REMOVE IF ISSUES

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=400

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif



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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

fu! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endf

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

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
