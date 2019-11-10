set hidden
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

