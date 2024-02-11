return {
  "akinsho/bufferline.nvim",
  enabled = true,
  opts = {
    options = {
      tab_size = 8,
      buffer_close_icon = "",
      close_icon = "",
      show_buffer_icons = false,
      show_buffer_close_icons = false,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      separator_style = "thin",
      offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "NvimTree",
          text = "Explorer",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "DiffviewFiles",
          text = "Diff View",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "flutterToolsOutline",
          text = "Flutter Outline",
          highlight = "PanelHeading",
        },
        {
          filetype = "lazy",
          text = "Lazy",
          highlight = "PanelHeading",
          padding = 1,
        },
      },
    },
  },
}
