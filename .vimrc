call plug#begin('~/.vim/vendor')
" LSP
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'honza/vim-snippets'

" Coding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-rails' " Slows down opening rails files
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'janko/vim-test'

" Syntax
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'cakebaker/scss-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'StanAngeloff/php.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'digitaltoad/vim-pug'
Plug 'jparise/vim-graphql'

" Project management
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'rbong/vim-flog'
Plug 'tpope/vim-dispatch'
Plug 'lambdalisue/fern.vim'

" Debugger
Plug 'puremourning/vimspector'

" Visual
Plug 'gruvbox-community/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Luxed/ayu-vim'
Plug 'itchyny/lightline.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'machakann/vim-highlightedyank'
call plug#end()

let g:mapleader=" "
let g:highlightedyank_highlight_duration = 40

" Utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>w :w!<cr>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <C-k> :bprev<CR>
nnoremap <C-j> :bnext<CR>
nnoremap <C-q> :Bclose<CR>
nnoremap <leader>ba :bufdo :bdelete<cr>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <C-6> <C-^>
inoremap <C-c> <esc>
noremap <C-y> "+y

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

command! -bang -bar -nargs=* Gpush execute 'Dispatch<bang> -dir=' .
      \ fnameescape(FugitiveGitDir()) 'git push' <q-args>
command! -bang -bar -nargs=* Gfetch execute 'Dispatch<bang> -dir=' .
      \ fnameescape(FugitiveGitDir()) 'git fetch' <q-args>

