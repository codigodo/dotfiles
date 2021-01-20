" set completeopt=menuone,noinsert,noselect

" nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
" nnoremap <silent>gy :lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent>gi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent>gr :lua vim.lsp.buf.references()<CR>
" nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
" nnoremap <silent><C-k> :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>ff :lua vim.lsp.buf.formatting()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.solargraph.setup{ on_attach=require'completion'.on_attach }
" lua require'lspconfig'.intelephense.setup{ on_attach=require'completion'.on_attach; init_options = { storagePath = '/tmp/intelephense', licenceKey = os.getenv('INTELEPHENSE_KEY') } }
