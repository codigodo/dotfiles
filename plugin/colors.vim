let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_selection='0'
set background=dark
colorscheme gruvbox
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
highlight Comment cterm=italic gui=italic
