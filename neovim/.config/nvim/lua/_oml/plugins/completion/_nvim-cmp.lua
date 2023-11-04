local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  luasnip = "[Snip]",
  cmp_tabnine = "[TN]",
  path = "[Path]",
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji", "onsails/lspkind.nvim" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local compare = require("cmp.config.compare")
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "cmp_tabnine" } }))
    opts.sorting = {
      priority_weight = 2,
      comparators = {
        require("cmp_tabnine.compare"),
        compare.offset,
        compare.exact,
        compare.score,
        compare.recently_used,
        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    }
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    -- opts.formatting = {
    --   fields = { "abbr", "kind", "menu" },
    --   expandable_indicator = true,
    --   format = function(entry, vim_item)
    --     -- if you have lspkind installed, you can use it like
    --     -- in the following line:
    --     vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
    --     vim_item.menu = source_mapping[entry.source.name]
    --     if entry.source.name == "cmp_tabnine" then
    --       local detail = (entry.completion_item.labelDetails or {}).detail
    --       vim_item.kind = ""
    --       if detail and detail:find(".*%%.*") then
    --         vim_item.kind = vim_item.kind .. " " .. detail
    --       end
    --
    --       if (entry.completion_item.data or {}).multiline then
    --         vim_item.kind = vim_item.kind .. " " .. "[ML]"
    --       end
    --     end
    --     local maxwidth = 80
    --     vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
    --     return vim_item
    --   end,
    -- }
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
