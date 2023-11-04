-- add any tools you want to have installed below
return {
  "williamboman/mason.nvim",
  optional = true,
  opts = function(_, opts)
    local ensure_installed = {
      "stylua",
      "codelldb",
      "shellcheck",
      "shfmt",
      "marksman",
      "flake8",
    }
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, ensure_installed)
    end
  end,
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
}
