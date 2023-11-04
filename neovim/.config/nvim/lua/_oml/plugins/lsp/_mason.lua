-- add any tools you want to have installed below
return
{
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  opts = {
    ensure_installed = {
      "stylua",
      "clangd",
      "shellcheck",
      "shfmt",
      "marksman",
      "flake8",
    },
    automatic_installation = true,
  },
}
