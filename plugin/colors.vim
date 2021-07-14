let system_theme = system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
let ayucolor="mirage"
let g:sonokai_style = 'atlantis'
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_selection='0'
let g:gruvbox_material_background = 'soft'
let g:molokai_original = 1
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if system_theme
  set background=dark
  colorscheme gruvbox
else
  set background=light
  colorscheme PaperColor
endif

highlight Comment cterm=italic gui=italic

function! Dark()
	set background=dark
  colorscheme gruvbox
  silent !sh ~/dotfiles/dark.sh
endfunction

function! Light()
	set background=light
  colorscheme PaperColor
  silent !sh ~/dotfiles/light.sh
endfunction

command! Dark call Dark()
command! Light call Light()


