-- with lazy.nvim
return {
  {
    "LintaoAmons/bookmarks.nvim",
    -- pin the plugin at specific version for stability
    -- backup your bookmark sqlite db when there are breaking changes
    -- tag = "v2.3.0",
    dependencies = {
      { "kkharji/sqlite.lua" },
      { "nvim-telescope/telescope.nvim" },
      { "stevearc/dressing.nvim" }, -- optional: better UI
    },
    config = function()
      local opts = {} -- go to the following link to see all the options in the deafult config file
      require("bookmarks").setup(opts) -- you must call setup to init sqlite db
    end,
    keys = {
      { "mm", mode = { "n", "v" }, "<cmd>BookmarksMark<cr>", desc = "Mark current line into active BookmarkList." },
      { "mo", mode = { "n", "v" }, "<cmd>BookmarksGoto<cr>", desc = "Go to bookmark at current active BookmarkList" },
      { "ma", mode = { "n", "v" }, "<cmd>BookmarksCommands<cr>", desc = "Find and trigger a bookmark command." },
    },
  },
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup({})
    end,
  },
}
--  require("scope").setup({})
-- map({ "n", "v" }, "mm", "<cmd>BookmarksMark<cr>", { desc = "Mark current line into active BookmarkList." })
-- map({ "n", "v" }, "mo", "<cmd>BookmarksGoto<cr>", { desc = "Go to bookmark at current active BookmarkList" })
-- map({ "n", "v" }, "ma", "<cmd>BookmarksCommands<cr>", { desc = "Find and trigger a bookmark command." })

-- run :BookmarksInfo to see the running status of the plugin

-- local cmplug = {
--   "hrsh7th/nvim-cmp",
--   enabled = true,
--   --------- @param opts cmp.ConfigSchema
--   opts = function(_, opts)
--     local has_words_before = function()
--       unpack = unpack or table.unpack
--       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--     end
--
--     local cmp = require("cmp")
--
--     opts.mapping = vim.tbl_extend("force", opts.mapping, {
--       ["<Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
--           cmp.select_next_item()
--         elseif vim.snippet.active({ direction = 1 }) then
--           vim.schedule(function()
--             vim.snippet.jump(1)
--           end)
--         elseif has_words_before() then
--           cmp.complete()
--         else
--           fallback()
--         end
--       end, { "i", "s" }),
--       ["<S-Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_prev_item()
--         elseif vim.snippet.active({ direction = -1 }) then
--           vim.schedule(function()
--             vim.snippet.jump(-1)
--           end)
--         else
--           fallback()
--         end
--       end, { "i", "s" }),
--     })
--   end,
-- }
--
-- return cmplug
--

-- -- vim.cmd("e " .. srcpath)
-- local currentfilepath = vim.api.nvim_eval("expand('%')") -- returns path to current file lua/_oml/utils/_helpers.lua
-- local path_split = vim.fn.split(currentfilepath, "/") -- returns table ( array kindof ) {"lua", "_oml", "utils", "_helpers.lua" }
-- local filename = path_split[#path_split] -- get last item in table ( helpers.lua )
-- local requirename = string.gsub(filename, "%.lua?$", "") -- trim off .lua\n
-- local parent_dir = path_split[#path_split - 1] -- utils
-- local require_string = vim.fn.join({ "_oml.plugins", parent_dir, requirename }, ".")
-- local require_statement = 'local plugin_spec = require("' .. require_string .. '")'
-- vim.cmd("normal i" .. require_statement)
