set background=dark

let ayucolor="mirage"
let g:sonokai_style = 'atlantis'
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection='0'

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

colorscheme gruvbox

highlight Comment cterm=italic gui=italic
