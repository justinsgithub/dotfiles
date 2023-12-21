-- add pyright to lspconfig
-- add pyright to lspconfig
return
-- add pyright to lspconfig
{
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      lua_ls = {
        -- mason = false, -- set to false if you don't want this server to be installed with mason
        -- Use this to add any additional keymaps
        -- for specific lsp servers
        ---@type LazyKeysSpec[]
        -- keys = {},
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = "Disable",
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
      -- Ensure mason installs the server
      rust_analyzer = {
        keys = {
          { "K", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
          { "<leader>cR", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
          { "<leader>Dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
        },
      },
      -- pyright will be automatically installed with mason and loaded with lspconfig
      pyright = {},
    },
  },
}
