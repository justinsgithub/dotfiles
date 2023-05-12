local servers = {
	"sumneko_lua",
	"emmet_ls",
	"prismals",
	--[[ "solargraph", ]]
	"cssls",
	"html",
	"tsserver",
	"jedi_language_server",
	"pyright",
	"tailwindcss",
	"bashls",
	"jsonls",
	--[[ "yamlls", ]]
	"volar",
	"vimls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
local neodev_status_ok, neodev = pcall(require, "neodev")
if not neodev_status_ok then
	return
end

neodev.setup({
	-- add any options here, or leave empty to use the default settings
})

local m_ok, mason = pcall(require, "mason")
if not m_ok then
	return
end

mason.setup(settings)


local ml_ok, masonconf = pcall(require, "mason-lspconfig")
if not ml_ok then
	return
end

masonconf.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local ok, ts = pcall(require, "typescript")
--[[ if not ok then ]]
--[[   return ]]
--[[ end ]]

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

  -- incase a language server has @ in its name or starts with @ ??? 
	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	if server == "tsserver" then
		ts.setup({
			disable_commands = false, -- prevent the plugin from creating Vim commands
			debug = false, -- enable debug logging for commands
			go_to_source_definition = {
				fallback = true, -- fall back to standard LSP definition on failure
			},
      server = { -- pass options to lspconfig's setup method
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
      }
			,
		})
	else
		lspconfig[server].setup(opts)
	end
end
