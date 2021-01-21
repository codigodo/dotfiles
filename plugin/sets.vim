syntax on

set nocompatible
set guicursor=a:block-Cursor
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=number

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80

set timeoutlen=1000 ttimeoutlen=0

if !has('gui_running')
  set showmatch " Briefly jump to a paren once it's balanced
  set matchpairs+=\<:\>
  " With `Cursor guibg=fg guifg=bg` + default MatchParen styling, it makes the
  " cursor seem like it has actually jumped to the patching pair. This instead
  " makes the MatchParen style preserve the background color, so that the
  " Cursor can flip it appropriately.
  hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=bg guifg=lightblue ctermbg=bg ctermfg=lightblue
endif
