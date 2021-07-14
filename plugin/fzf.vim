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

nnoremap <silent> <C-f> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

function! s:get_git_root()
  let l:root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  if v:shell_error
      return ''
  endif
  return l:root
endfunction

function! s:gitfiles_monorepo()
  let l:root = s:get_git_root()
  let l:path = substitute(getcwd(), l:root, '', '')
  let l:path = substitute(l:path, '/', '', '')

  let l:options = '-m --preview "head -20 {1}" --prompt "GitFiles> " '
  if l:path != ''
    let l:options .= '--query '.l:path
  endif

  call fzf#run({
  \ 'source':  'git ls-files | uniq',
  \ 'sink': 'e',
  \ 'dir': l:root,
  \ 'options': l:options,
  \ 'down':    '40%'
  \})
endfunction
command! GFilesMonorepo call s:gitfiles_monorepo()

nnoremap <silent> <C-h> :GFilesMonorepo<CR>
