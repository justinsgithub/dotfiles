vim.cmd [[
try
  colorscheme vim-monokai-tasty
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
