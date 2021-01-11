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
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Project management
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-dispatch'
Plug 'lambdalisue/fern.vim'

" Debugger
Plug 'puremourning/vimspector'

" Visual
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'

" Tools
Plug 'vuciv/vim-bujo'
call plug#end()

" Config

let g:mapleader=" "

nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
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

" Utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" Helpers
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
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
endfunction
