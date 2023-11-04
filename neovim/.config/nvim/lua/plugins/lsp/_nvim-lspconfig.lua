return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  -- opts = {
  --   ---@type lspconfig.options
  --   servers = {
  -- tsserver will be automatically installed with mason and loaded with lspconfig
  -- tsserver = {},
  -- Ensure mason installs the server
  -- rust_analyzer = {
  --   keys = {
  --     { "K", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
  --     { "<leader>cR", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
  --     { "<leader>Dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
  --   },
  -- },
  -- add pyright to lspconfig
  -- pyright will be automatically installed with mason and loaded with lspconfig
  -- pyright = {},
  --   },
  -- },
  opts = {
    servers = {
      -- Ensure mason installs the server
      clangd = {
        keys = {
          { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "Makefile",
            "configure.ac",
            "configure.in",
            "config.h.in",
            "meson.build",
            "meson_options.txt",
            "build.ninja"
          )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
            fname
          ) or require("lspconfig.util").find_git_ancestor(fname)
        end,
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },
    },
    setup = {
      clangd = function(_, opts)
        local clangd_ext_opts = require("lazyvim.util").opts("clangd_extensions.nvim")
        require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
        return false
      end,
    },
  },
}
