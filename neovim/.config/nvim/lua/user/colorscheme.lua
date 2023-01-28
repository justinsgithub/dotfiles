vim.g.vim_monokai_tasty_italic = 1
--[[ vim.g.vim_monokai_tasty_machine_tint = 1 ]]
vim.g.vim_monokai_tasty_highlight_active_window = 1
vim.cmd [[
try
  colorscheme vim-monokai-tasty
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

vim.cmd[[hi Normal guibg=NONE ctermbg=NONE]]
