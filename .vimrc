call plug#begin('~/.vim/vendor')

" Coding
Plug 'tpope/vim-rails' " Slows down opening rails files
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'janko/vim-test'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'honza/vim-snippets'

" Project management
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-dispatch'
Plug 'lambdalisue/fern.vim'

" Debugger
Plug 'puremourning/vimspector'

" Visual
Plug 'tomasr/molokai'
Plug 'hugolgst/vimsence'

" Syntax
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'cakebaker/scss-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'posva/vim-vue'
Plug 'StanAngeloff/php.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Tools
Plug 'vuciv/vim-bujo'
call plug#end()

let g:mapleader=" "
let g:highlightedyank_highlight_duration = 40
let g:vimsence_editing_details = '{}'
let g:vimsence_editing_state = 'Covered in coconut oil'

" Utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Vim TODO
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal

nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>w :w!<cr>
nnoremap <leader>bd :Bclose<cr>
nnoremap <leader>ba :bufdo bd<cr>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <C-6> <C-^>
inoremap <C-c> <esc>

" Helpers
command! Bclose call BufcloseCloseIt()
fun! BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfun

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
