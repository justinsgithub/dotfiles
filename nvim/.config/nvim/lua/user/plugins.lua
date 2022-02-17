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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window

-- packer.init {
--  display = {
--    open_fn = function()
--      return require("packer.util").float { border = "rounded" }
--    end,
--  },
--}

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	-- use "moll/vim-bbye"
	use("nvim-lualine/lualine.nvim")
	-- use "akinsho/toggleterm.nvim"
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")
	--use "Xuyuanp/nerdtree-git-plugin"
	--use "tiagofumo/vim-nerdtree-syntax-highlight"
	use("lilydjwg/colorizer")
	use("ryanoasis/vim-devicons")
	use("phanviet/vim-monokai-pro")
	use("sainnhe/sonokai")
--	use("patstockwell/vim-monokai-tasty")
	use("justinsgithub/vim-monokai-tasty")
	use("HerringtonDarkholme/yats.vim")
	use("pangloss/vim-javascript")
	use("MaxMEllon/vim-jsx-pretty")
	use("styled-components/vim-styled-components")
	use("elzr/vim-json")
	use("jparise/vim-graphql")
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}


	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	-- use "lunarvim/darkplus.nvim"
	-- use "folke/tokyonight.nvim"
	-- use "rebelot/kanagawa.nvim"
	use("tanvirtin/monokai.nvim")

	use("onsails/lspkind-nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use({
		"tzachar/cmp-tabnine",
		config = function()
			local tabnine = require("cmp_tabnine.config")
			tabnine:setup({
				max_lines = 1000,
				max_num_results = 20,
				sort = true,
			})
		end,

		run = "./install.sh",
		requires = "hrsh7th/nvim-cmp",
	})
	-- use 'David-Kunz/cmp-npm' -- doesn't seem to work

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("filipdutescu/renamer.nvim")
	use("simrat39/symbols-outline.nvim")
	use("ray-x/lsp_signature.nvim")
	use("b0o/SchemaStore.nvim")
	use({
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	})
	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Recently added
	use("rcarriga/nvim-notify")
	use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
