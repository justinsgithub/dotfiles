--[[ nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR> ]]
--[[ nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR> ]]
--[[ nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR> ]]

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = false, -- default bindings on <c-w>
			nav = false, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<CR>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows ytur active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		-- i = { "j", "k" },
		-- v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	a = { "<cmd>Alpha<CR>", "Alpha" },
	e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },

	f = {
		name = "Find",
		b = { "<cmd>Telescope git_branches<CR>", "Checkout Branch" },
		c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
		f = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
			"Find File",
		},
		M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
		F = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
		r = { ":%s/", "Search And Replace" },
		p = {
			"<cmd>Telescope projects<CR>",
			"Find Project",
		},
		t = { ":Telescope live_grep theme=ivy<CR>", "Find Text" },
		R = { "<cmd>Telescope registers<CR>", "Registers" },
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
		C = { "<cmd>Telescope commands<CR>", "Commands" },
	},

	h = { "<cmd>nohlsearch<CR>", "No Highlight" },
	q = { "<cmd>q!<CR>", "Quit" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<CR>", "Compile" },
		i = { "<cmd>PackerInstall<CR>", "Install" },
		s = { "<cmd>PackerSync<CR>", "Sync" },
		S = { "<cmd>PackerStatus<CR>", "Status" },
		u = { "<cmd>PackerUpdate<CR>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
		o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<CR>", "Diff" },
	},
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<CR>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<CR>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
		i = { "<cmd>LspInfo<CR>", "Info" },
		I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
    p = {"<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Go To Preview"},
    P = {"<cmd>lua require('goto-preview').close_all_win()<CR>", "Close Preview Windows"},
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		T = { "<cmd>TroubleToggle<CR>", "Trouble Toggle" },
		s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols" },
	},
	t = {
		name = "TypeScript",
		r = { "<cmd>TypescriptRenameFile<CR>", "Rename File" },
		o = { "<cmd>TypescriptOrganizeImports<CR>", "Organize Imports" },
	},
	w = {
		name = "Window",
		h = { "<cmd>split<CR>", "Split Horizontal" },
		v = { "<cmd>vsplit<CR>", "Split Vertical" },
		c = { "<cmd>close<CR>", "Close Window" },
	},
	P = { "<cmd>lua require('telescope').extensions.projects.projects()<CR>", "Projects" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
