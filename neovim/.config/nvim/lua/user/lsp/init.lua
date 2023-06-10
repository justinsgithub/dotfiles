--[[ local sig_status_ok, sig = pcall(require, "lsp_signature") ]]
--[[ if not sig_status_ok then ]]
--[[ 	return ]]
--[[ end ]]
--[[]]
--[[ sig.setup({ ]]
--[[ 	bind = true, -- This is mandatory, otherwise border config won't get registered. ]]
--[[ 	handler_opts = { ]]
--[[ 		border = "rounded", ]]
--[[ 	}, ]]
--[[ }) ]]

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
