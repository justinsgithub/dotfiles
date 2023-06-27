vim.opt.termguicolors = true

local c_status_ok, colorizer = pcall(require, "colorizer")
if not c_status_ok then
	return
end

colorizer.setup({
		"css",
		"scss",
		"html",
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"lua",
		"json",
		"toml",
		"yaml",
	},
	{
		RGB = true, -- #RGB hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		rgb_fn = true, -- CSS rgb() and rgba() functions
		hsl_fn = true, -- CSS hsl() and hsla() functions
		css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
		css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
})

local m_ok, mpro = pcall(require, "oh-my-monokai")
if not m_ok then
	return
end

mpro.setup({
	transparent_background = true,
	palette = "justinsgithub",
})

vim.cmd([[
try
  colorscheme oh-my-monokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

-- vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
