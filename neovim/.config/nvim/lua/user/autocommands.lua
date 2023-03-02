vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown,text call AutoCorrect()
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  " augroup _illuminate_augroup
  "   autocmd!
  "   autocmd VimEnter * hi link illuminatedWord ErrorMsg
  " augroup END
  "
  " augroup illuminate_augroup
  "   autocmd!
  "   autocmd VimEnter * hi illuminatedWord cterm=italic gui=italic
  " augroup END
  "
  " augroup illuminate_augroup1
  "   autocmd!
  "   autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic
  " augroup END
  "
  " to also close nvim_tree when quitting, (does not work properly, just close nvim tree first)
  " augroup _nvim_tree 
  "   autocmd!
  "   autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  " augroup end
]])

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
