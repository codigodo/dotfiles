set nocompatible
filetype plugin indent on
let g:mapleader=" "

syntax on
set cursorline
set relativenumber
set noerrorbells
set timeoutlen=1000 ttimeoutlen=0
set nohlsearch
set hidden
set nowritebackup
set laststatus=2
set noshowmode

" Research this
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set cmdheight=2
set backspace=2
set updatetime=50
set shortmess+=c
set colorcolumn=80
" End of research

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
Plug 'tpope/vim-dispatch'
Plug 'lambdalisue/fern.vim'

" Debugger
Plug 'puremourning/vimspector'

" Visual
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'

" Tools
Plug 'vuciv/vim-bujo'
call plug#end()

let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_selection='0'
set background=dark
colorscheme gruvbox
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
highlight Comment cterm=italic gui=italic

" Config

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Vim test
let test#strategy = "dispatch"

" FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

" Mapping

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')

" Window management
nmap <leader>w :w!<cr>
nmap <leader>bd :Bclose<cr>
nmap <leader>ba :bufdo bd<cr>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
noremap <C-6> <C-^>

" Fer
nnoremap <leader>pv :Fern .<CR>

" Git
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" Utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" FZF
nnoremap <silent> <C-f> :GFiles<CR>

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" vim-test mappings
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

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
