local ok1, telescope = pcall(require, "telescope")
if not ok1 then
	return
end

local ok2, project = pcall(require, "project_nvim")
if not ok2 then
	return
end

project.setup({
	active = true,
	on_config_done = nil,
	manual_mode = false,
	detection_methods = { "pattern" }, -- removed lsp
	patterns = { "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
	show_hidden = true,
	silent_chdir = true, -- false is HIGHLY ANNOYING
	scope_chdir = "global", -- tab, win
	ignore_lsp = {},
	datapath = vim.fn.stdpath("data"),
})

local actions = require("telescope.actions")

telescope.setup({
	extensions = {
		project = {
			base_dirs = {
				--[[ "~/github/justinsgithub/prisma-generator-next", ]]
				--[[ "~/github/justinsgithub/prisma-generator-next/generator", ]]
				--[[ "~/github/justinsgithub/prisma-generator-next/testing", ]]
				--[[ "~/github/justinsgithub/prisma-generator-next/usage", ]]
				-- { "~/github/justinsgithub/prisma-generator-next" },
				-- { "~/dev/src3", max_depth = 4 },
				-- { path = "~/dev/src4" },
				-- { path = "~/dev/src5", max_depth = 2 },
			},
			hidden_files = true, -- default: false
			-- theme = "dropdown", do not like
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true, -- default false
		},
            fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
	},
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				-- ["<C-u>"] = actions.preview_scrolling_up,
				-- ["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
})

telescope.load_extension("projects")
telescope.load_extension("project")
telescope.load_extension("fzf")
