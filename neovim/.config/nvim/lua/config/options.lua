-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.clipboard = "" -- As it should be
opt.ignorecase = false -- Let's not be ignorant

opt.showcmd = true

opt.foldmethod = "manual"
opt.foldcolumn = "1"
opt.scrolloff = 8 -- Lines of context
