require("user.plugins")
require("user.alpha")
require("user.autocommands")
--[[ require("user.autocorrect") ]]
require("user.autopairs")
require("user.bufferline")
require("user.cmp")
require("user.colorscheme")
require("user.comment")
require("user.gitsigns")
require("user.hot-reload")
require("user.impatient")
require("user.indentline")
require("user.keymaps")
require("user.lsp")
require("user.lualine")
require("user.notify")
require("user.nvim-tree")
require("user.options")
require("user.project")
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

mark a spot locally in current file
m<a-z>

go to locally marked spot in file
'<a-z>

mark a spot globally
m<A-Z>

go to globally marked spot
'<A-Z>


]]

-- VIM MACROS
--[[

use macros to record an action you need repeated multiple times in file
such as adding 3 dashes to end and beginning of every paragraph in file

press q to start recording macro
press letter you want to save the recorded macro to
press whatever keys needed to perform action you need repeated
press q to stop recording macro

]]
