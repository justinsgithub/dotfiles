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
vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end]])
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
end
)
