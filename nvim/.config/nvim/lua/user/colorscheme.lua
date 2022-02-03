-- monokai
-- default
-- vim-monokai-tasty

vim.cmd([[
try
  colorscheme default 
catch /^Vim\%((\a\+)\)\=:E185/
 colorscheme default
set background=dark
endtry
]])
