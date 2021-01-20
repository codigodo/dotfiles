set background=dark

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

highlight Comment cterm=italic gui=italic
