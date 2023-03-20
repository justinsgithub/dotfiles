-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
  -- project.nvim
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		--update_root = true,
		ignore_list = {},
	},
  -- end project.nvim
	actions = {
		file_popup = {
			open_win_config = {},
		},
	},
	sort_by = "case_sensitive",
	disable_netrw = true,
	renderer = {
		add_trailing = false,
		group_empty = true,
		highlight_git = true,
		full_name = true,
		highlight_opened_files = "all", -- none, name, icon, all
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				edge = "│",
				item = "│",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	},
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	--  auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	-- update_to_buf_dir = {
	--   enable = true,
	--   auto_open = true,
	-- },
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	view = {
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				--[[ width = 30, ]]
				--[[ height = 30, ]]
				row = 1,
				col = 1,
			},
		},
		preserve_window_proportions = false,
		width = "99%",
		hide_root_folder = false,
		side = "left",
		adaptive_size = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "d", cb = tree_cb("trash") },
				{ key = "D", cb = tree_cb("remove") },
			},
		},
		number = true,
		relativenumber = true,
	},
	--[[ trash = { ]]
	--[[ 	cmd = "gio trash", -- default ]]
	--[[ 	require_confirm = true, ]]
	--[[ }, ]]
	-- quit_on_open = 0,
	-- git_hl = 1,
	-- disable_window_picker = 0,
	-- root_folder_modifier = ":t",
	-- show_icons = {
	--   git = 1,
	--   folders = 1,
	--   files = 1,
	--   folder_arrows = 1,
	--   tree_width = 30,
	-- },
})
