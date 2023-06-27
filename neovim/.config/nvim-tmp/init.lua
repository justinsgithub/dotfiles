-- recommended by nvim-tree
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
require("user.plugins")
require("user.alpha")
require("user.autocommands")
require("user.autopairs")
-- require("user.bufferline")
require("user.cmp")
require("user.colorscheme")
require("user.comment")
require("user.gitsigns")
require("user.hot-reload")
require("user.impatient")
require("user.indentline")
require("user.illuminate")
require("user.keymaps")
require("user.lsp")
require("user.lualine")
require("user.notify")
require("user.nvim-tree")
require("user.options")
require("user.telescope")
require("user.treesitter")
require("user.whichkey")

-- VIM HINTS
--[[

double space entire file
:%s/.*\n/\0\r/g

search for EXACT word under cursor
*

search for word under cursor including partials ("for" would also find "forlorn")
g* 

search for words that end in the
/the\> 

search for the exact word the
/\<the\> 

finds there and these 
/the.e 

MARKS

a mark is automatically deleted when its line is deleted

mark a spot locally in current file
m<a-z>

go to line of locally marked spot in file
'<a-z>

go to line and column of locally marked spot in file
`<a-z>

mark a spot globally
m<A-Z>

go to line of globally marked spot
'<A-Z>

go to line and column of globally marked spot
`<A-Z>

delete mark a
:delmarks a

delete marks a, b, c, d
:delmarks a-d

delete marks a, b, x, y
:delmarks abxy

delete marks a, A
:delmarks aA

delete all lowercase marks for the current buffer (a-z)
:delmarks!

-- VIM MACROS

use macros to record an action you need repeated multiple times in file
such as adding 3 dashes to end and beginning of every paragraph in file

press q<KEY>  to start recording macro (saved to KEY)
press whatever keys needed to perform action you need repeated
press q to stop recording macro

press @<KEY> to use macro

-- INCREMENT
visual block select

g<Ctrl+a>


]]
