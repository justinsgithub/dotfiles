local flashopts = {
  search = {
    mode = function(str)
      return "\\<" .. str
    end,
  },
  jump = {
    autojump = true,
  },
}

return {
  {
    "ggandor/flit.nvim",
    enabled = false,
  },
  {
    "ggandor/leap.nvim",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump(flashopts)
        end,
        desc = "Flash",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote(flashopts)
        end,
        desc = "Remote Flash",
      },
    },
  },
}
