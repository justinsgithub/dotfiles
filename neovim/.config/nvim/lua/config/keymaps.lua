local map = vim.keymap.set
-- random helper functions for OML config development
-- not being required or used anywhere
-- keeping in config for examples to learn from
vim.api.nvim_create_user_command("ConsoleLog", function(_)
  local logthis = vim.api.nvim_eval("expand('<cWORD>')")
  local qlogthis = '"' .. logthis .. '", '
  local a = 'yiwoconsole.log(' .. qlogthis .. logthis .. ')'
  vim.api.nvim_feedkeys(a, "t", false)
  vim.cmd("normal mzo`z")

end, {
  desc = "console.log quickly",
  force = true,
  nargs = 0,
})

vim.api.nvim_create_user_command("OpenLine", function(opts)
  local where = opts.fargs[1]
  if where == "below" then
    vim.cmd("normal mzo`z")
  else
    vim.cmd("normal mzO`z")
  end
end, {
  desc = "Better open line",
  force = true,
  nargs = 1,
})

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
map("n", "]<TAB>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "[<TAB>", "<cmd>tabprev<cr>", { desc = "Previous Tab" })
map("n", "<leader>hh", "<cmd>e ~/.config/nvim/TIPS.md<cr>", { desc = "Neovim Tips" })
map("n", "<localleader>Q", "<cmd>qall<cr>", { desc = "Exit Neovim" })
map("n", "<localleader>q", "<cmd>q<cr>", { desc = "Quit Window" })
map("n", "<localleader>w", "<cmd>w<cr>", { desc = "Save Buffer" })
map("n", "<localleader>S", "<cmd>wall<cr>", { desc = "Save All Buffers" })
map("n", "<localleader>W", "<cmd>wqall<cr>", { desc = "Save and Quit" })
map("n", "<localleader>ao", "<cmd>OpenLine below<cr>", { desc = "Better Open Line" })
map("n", "<localleader>ac", "<cmd>ConsoleLog<cr>", { desc = "Console Log This" })
vim.keymap.set("i", "<CR>", "<CR>", { noremap = true, silent = true })
