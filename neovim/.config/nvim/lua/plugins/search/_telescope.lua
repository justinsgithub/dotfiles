local Util = require("lazyvim.util")
return {
  "nvim-telescope/telescope.nvim",
  commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
  cmd = "Telescope",
  version = false,
  keys = {
    { "<Leader>,", false },
    { "<Leader>/", false },
    { "<Leader>:", false },
    { "<Leader><Space>", false },
    { "<Leader>fc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    -- stylua: ignore add a keymap to browse plugin files
    {
      "<leader>fP",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
      -- add a keymap to browse LazyVim default config
      -- stylua: ignore
    {
      "<leader>fC",
      function() require("telescope.builtin").live_grep({ cwd = vim.fn.stdpath("data") .. "/lazy/LazyVim/lua/lazyvim" }) end,
      desc = "Find LazyVim Config",
    },
    {
      "<Leader>ft",
      Util.telescope("live_grep"),
      desc = "Text",
    },
    { "<Leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    {
      "<Leader>fB",
      "<cmd>Telescope buffers show_all_buffers=true<cr>",
      desc = "All Buffers",
    },
    {
      "<Leader>fw",
      Util.telescope("grep_string"),
      desc = "Word (root dir)",
    },
    {
      "<Leader>fW",
      Util.telescope("grep_string", { cwd = false }),
      desc = "Word (cwd)",
    },
    {
      "<Leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    -- git
    { "<Leader>gc", "<cmd>Telescope git_commits<cr>", desc = "commits" },
    { "<Leader>gs", "<cmd>Telescope git_status<cr>", desc = "status" },
  },
}
