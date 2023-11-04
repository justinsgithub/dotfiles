local ensure_installed = {
  "c",
  "cpp",
  "bash",
  "html",
  "http",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "regex",
  "tsx",
  "typescript",
  "vim",
  "yaml",
}
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
  opts = function(_, opts)
    opts.autotag = { enable = true }
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, ensure_installed)
    end
  end,
}
