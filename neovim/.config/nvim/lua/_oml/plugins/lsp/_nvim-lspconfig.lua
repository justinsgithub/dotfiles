-- INFO: do not need typescript example (handled through imports.plugins.extras.lang.typescript)
return {
  "neovim/nvim-lspconfig",
  -- dependencies = {
  --   "jose-elias-alvarez/typescript.nvim",
  --   init = function()
  --     require("lazyvim.util").on_attach(function(_, buffer)
  --         -- stylua: ignore
  --         vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
  --       vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
  --     end)
  --   end,
  -- },
  ---@class PluginLspOpts
  opts = {
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      -- example to setup with typescript.nvim
      -- return true if you don't want this server to be setup with lspconfig
      -- tsserver = function(_, opts)
      --   require("typescript").setup({ server = opts })
      --   return true
      -- end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
    ---@type lspconfig.options
    servers = {
      -- tsserver will be automatically installed with mason and loaded with lspconfig
      -- tsserver = {},
      -- Ensure mason installs the server
      rust_analyzer = {
        keys = {
          { "K", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
          { "<leader>cR", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
          { "<leader>Dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
        },
      },
      -- add pyright to lspconfig
      -- pyright will be automatically installed with mason and loaded with lspconfig
      pyright = {},
    },
  },
}
