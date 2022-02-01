-- monokai
-- default

vim.cmd([[
try
  colorscheme monokai_soda
catch /^Vim\%((\a\+)\)\=:E185/
 colorscheme default
set background=dark
endtry
]])
