vim.opt.termguicolors = true

local i_status_ok, illuminate = pcall(require, "illuminate")
if not i_status_ok then
	return
end

local c_status_ok, colorizer = pcall(require, "colorizer")
if not c_status_ok then
	return
end

-- default config
illuminate.configure({})

colorizer.setup({ "css", "scss", "html", "javascript", "typescript", "javascriptreact", "typescriptreact" }, {
	RGB = true, -- #RGB hex codes
	RRGGBB = true, -- #RRGGBB hex codes
	RRGGBBAA = true, -- #RRGGBBAA hex codes
	rgb_fn = true, -- CSS rgb() and rgba() functions
	hsl_fn = true, -- CSS hsl() and hsla() functions
	css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
})

vim.g.vim_monokai_tasty_italic = 1
--[[ vim.g.vim_monokai_tasty_machine_tint = 1 ]]
vim.g.vim_monokai_tasty_highlight_active_window = 1
vim.cmd([[
try
  colorscheme vim-monokai-tasty
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
