" set completeopt=menuone,noselect
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
" nnoremap <silent>gy :lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent>gi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent>gr :lua vim.lsp.buf.references()<CR>
" nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
" " nnoremap <silent><C-k> :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>ff :lua vim.lsp.buf.formatting()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

" lua <<EOF
" local function on_attach()
" end
" local lspconfig = require'lspconfig'

" lspconfig.tsserver.setup{ on_attach=on_attach }
" lspconfig.solargraph.setup{ on_attach=on_attach }
" lspconfig.intelephense.setup{ on_attach=on_attach; init_options = { storagePath = '/tmp/intelephense', licenceKey = os.getenv('INTELEPHENSE_KEY') } }
" lspconfig.vuels.setup{ on_attach=on_attach }
" lspconfig.html.setup{ on_attach=on_attach }
" lspconfig.jsonls.setup{ on_attach=on_attach }
" lspconfig.cssls.setup{ on_attach=on_attach }
" lspconfig.bashls.setup{ on_attach=on_attach }
" lspconfig.vimls.setup{ on_attach=on_attach }
" lspconfig.yamlls.setup{ on_attach=on_attach }
" EOF

" let g:compe = {}
" let g:compe.enabled = v:true
" let g:compe.autocomplete = v:true
" let g:compe.debug = v:false
" let g:compe.min_length = 1
" let g:compe.preselect = 'enable'
" let g:compe.throttle_time = 80
" let g:compe.source_timeout = 200
" let g:compe.incomplete_delay = 400
" let g:compe.max_abbr_width = 100
" let g:compe.max_kind_width = 100
" let g:compe.max_menu_width = 100
" let g:compe.documentation = v:true

" let g:compe.source = {}
" let g:compe.source.path = v:true
" let g:compe.source.buffer = v:true
" let g:compe.source.calc = v:true
" let g:compe.source.nvim_lsp = v:true
" let g:compe.source.nvim_lua = v:true
" let g:compe.source.vsnip = v:true

" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
