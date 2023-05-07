local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- PackerCompile needs to be ran anytime plugins are changed
-- PackerClean will remove unused plugins
-- PackerUpdate will remove unused, update current, and install new plugins
-- PackerInstall will install new plugins
-- PackerSync will Perform `PackerUpdate` and then `PackerCompile`.
-- SLOW INTERNET - PackerInstall && PackerCompile

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--[[ augroup packer_user_config ]]
--[[   autocmd! ]]
--[[   autocmd BufWritePost plugins.lua source <afile> | PackerSync ]]
--[[ augroup end ]]
-- ]])
-- Use a protected call so we don't error out on first use

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- rm packer_compiled.lua if acting weird
-- Install plugins here
return packer.startup(function(use)
	use({
		"MunifTanjim/nui.nvim",
		{ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" },
		{ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }, -- Useful lua functions used by lots of plugins
		{ "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }, -- Autopairs, integrates with both cmp and treesitter
		{ "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" },
		{ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" },
		{ "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" },
		{ "nvim-treesitter/nvim-treesitter", commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac", run = ":TSUpdate" },
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08",
			requires = "nvim-treesitter/nvim-treesitter",
		},
	})

	--[[ use({ "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }) ]]
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" })
  use {
  'kdheepak/tabline.nvim',
  config = function()
    require'tabline'.setup {
      -- Defaults configuration options
      enable = true,
      -- options = {
      -- If lualine is installed tabline will use separators configured in lualine by default.
      -- These options can be used to override those settings.
      --  section_separators = {'', ''},
      --  component_separators = {'', ''},
      --  max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
      --  show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
      --  show_devicons = true, -- this shows devicons in buffer section
      --  show_bufnr = false, -- this appends [bufnr] to buffer section,
      --  show_filename_only = false, -- shows base filename only instead of relative path in filename
      --  modified_icon = "+ ", -- change the default modified icon
      --  modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
      --  show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
      -- }
    }
    vim.cmd[[
      "set guioptions-=e " Use showtabline in gui vim ()
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
  end,
  -- requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  requires = 'kyazdani42/nvim-web-devicons'
}
	-- use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" } do not need terminal in text editor

	use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })
	use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })
	use({ "folke/which-key.nvim" })

	--[[ use("wakatime/vim-wakatime") ]]

	-- colorscheme plugins
	use({
		"loctvl842/monokai-pro.nvim",
		commit = "c49d65af794cd97c49331237eb7ae208b93f9363",
		config = function()
			require("monokai-pro").setup({
				transparent_background = false,
				filter = "pro",
				--[[ override = function() ]]
				--[[ 	return { ]]
				--[[ 		Normal = { bg = "#000000" }, ]]
				--[[ 	} ]]
				--[[ end, ]]
			})
		end,
	})
	use("patstockwell/vim-monokai-tasty")
	use("HerringtonDarkholme/yats.vim")
	use("pangloss/vim-javascript")
	use("MaxMEllon/vim-jsx-pretty")
	use("styled-components/vim-styled-components")
	use("elzr/vim-json")
	use("jparise/vim-graphql")
	use("norcalli/nvim-colorizer.lua")
	use("LunarVim/lunar.nvim")
	--[[ use("/home/justin/github/justinsgithub/monokai-vibrant.nvim") ]]
	use("navarasu/onedark.nvim")
	use({
		"/home/justin/github/justinsgithub/oh-my-monokai.nvim",
		-- commit = "c49d65af794cd97c49331237eb7ae208b93f9363",
	})
	--[[ use({ ]]
	--[[ 	"/home/justin/github/justinsgithub/tab-daddy.nvim", ]]
	--[[ 	config = function() ]]
	--[[ 		require("nvchad_ui") ]]
	--[[ 	end, ]]
	--[[ }) ]]
	--[[ use{"justinsgithub/oh-my-monokai.nvim"} ]]
	use({ "rktjmp/lush.nvim" })

	-- cmp plugins
	use({ "folke/neodev.nvim" })
	use({ "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use({
		"tzachar/cmp-tabnine",
		config = function()
			local tabnine = require("cmp_tabnine.config")
			tabnine:setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
				run_on_every_keystroke = true,
				snippet_placeholder = "..",
				ignored_file_types = {
					-- default is not to ignore
					-- uncomment to ignore in lua:
					-- lua = true
				},
				show_prediction_strength = true,
			})
		end,
		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" }) -- enable LSP
	use({ "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" })
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup()
		end,
	})
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42", enabled = true })
	use({ "jose-elias-alvarez/typescript.nvim", commit = "f66d4472606cb24615dfb7dbc6557e779d177624" })
	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 15, -- Height of the floating window
				border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
				default_mappings = true, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				references = { -- Configure the telescope UI for slowing the references cycling window.
					telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
				},
				-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
				focus_on_open = true, -- Focus the floating window when opening it.
				dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
				force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
				bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
			})
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup(
				--{
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				--}
			)
		end,
	})
	-- not sure if needed
	use({
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	})

	--[[ use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for ]]

	-- Telescope
	use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })
	use({ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-project.nvim" })

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" })

	use("rcarriga/nvim-notify")
	use({ "ggandor/leap.nvim" })
	use("b0o/SchemaStore.nvim")
	use({ "windwp/nvim-ts-autotag" })

	--[[ use("joedbenjamin/pixelemconverter") ]]
	-- example of creating a basic vim plugin
	use({ "godlygeek/tabular" })
	use({ "panozzaj/vim-autocorrect" })
	use({ "preservim/vim-markdown", requires = "godlygeek/tabular" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
