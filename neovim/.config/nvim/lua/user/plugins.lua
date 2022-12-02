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
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- rm packer_compiled.lua if acting weird
-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  --[[ use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim ]]
  --[[ use("wbthomason/packer.nvim") -- Have packer manage itself ]]
  --[[ use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins ]]
  --[[ use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter ]]
  --[[ use("numToStr/Comment.nvim") -- Easily comment stuff ]]
  --[[ use("kyazdani42/nvim-web-devicons") ]]
  --[[ use("kyazdani42/nvim-tree.lua") ]]
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac", run = ":TSUpdate", })

  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08", requires="nvim-treesitter/nvim-treesitter" }
  use { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }
	use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
  --[[ use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" } ]]
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
	use {"folke/which-key.nvim"}

  --[[ use("JoosepAlviste/nvim-ts-context-commentstring") ]]
  --[[ use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" }) ]]
  --[[ use("moll/vim-bbye") ]]
  --[[ use("nvim-lualine/lualine.nvim") ]]
  --[[ use("ahmedkhalf/project.nvim") ]]
  --[[ use("lewis6991/impatient.nvim") ]]
  --[[ use("lukas-reineke/indent-blankline.nvim") ]]
  --[[ use("goolord/alpha-nvim") ]]
  --[[ use("folke/which-key.nvim") ]]

  --[[ use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight ]]
  use("wakatime/vim-wakatime")


  use("patstockwell/vim-monokai-tasty")
  use("pangloss/vim-javascript")
  use("MaxMEllon/vim-jsx-pretty")
  use("elzr/vim-json")
  use("styled-components/vim-styled-components")

  -- cmp plugins
  --[[ use("hrsh7th/nvim-cmp") -- The completion plugin ]]
  --[[ use("hrsh7th/cmp-buffer") -- buffer completions ]]
  --[[ use("hrsh7th/cmp-path") -- path completions ]]
  --[[ use("saadparwaiz1/cmp_luasnip") -- snippet completions ]]
  --[[ use("hrsh7th/cmp-nvim-lsp") ]]

  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
	use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" }
	use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
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

  use({
    "ray-x/lsp_signature.nvim",
    --[[ event = "BufRead", ]]
    --[[ config = function() ]]
    --[[   require("lsp_signature").setup() ]]
    --[[ end, ]]
  })

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  --[[ use("neovim/nvim-lspconfig") -- simple to use language server installer ]]
  --[[ use("williamboman/mason.nvim") -- simple to use language server installer ]]
  --[[ use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer ]]
  --[[ use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters ]]
	use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
	use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }
  --[[ use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for ]]

  -- Telescope
  --[[ use("nvim-telescope/telescope.nvim") ]]
	use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }


  -- Git
  --[[ use("lewis6991/gitsigns.nvim") ]]
	use ({ "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" })

  -- My new additions
  use("rcarriga/nvim-notify")
  -- use ("p00f/nvim-ts-rainbow") did not install correctly, may not desire anyways
  --[[ use("ggandor/lightspeed.nvim") ]]
  use("b0o/SchemaStore.nvim")
  use("ap/vim-css-color")
  use({
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
