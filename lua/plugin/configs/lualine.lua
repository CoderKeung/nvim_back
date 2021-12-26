local colors = {
  none = "NONE",
  bg = "#1b2b34",
  fg = "#d4be98",
  red = "#EC5f67",
  pink = "#d16d92",
  pink_pre = "#c594c5",
  orange = "#e78a4e",
  yellow = "#d8a657",
  green_pre = "#a9b665",
  blue_pre = "#62b3b2",
  blue = "#6699cc",
  green = "#5faf5f",
  white = "#c0c5ce",
  brown = "#7c6f64",
  black = "#282c34"
}

local custom = {
  normal = {
    a = {bg = colors.yellow, fg = colors.bg},
    b = {bg = colors.orange, fg = colors.black},
    x = {bg = colors.bg, fg = colors.fg},
    z = {bg = colors.red, fg = colors.bg}
  },
  insert = {
    a = {bg = colors.red, fg = colors.black},
    b = {bg = colors.orange, fg = colors.black},
    z = {bg = colors.red, fg = colors.bg},
  },
  visual = {
    a = {bg = colors.green, fg = colors.black},
    b = {bg = colors.orange, fg = colors.black},
    z = {bg = colors.red, fg = colors.bg}
  },
  command = {
    a = {bg = colors.blue, fg = colors.black},
    b = {bg = colors.orange, fg = colors.black},
    z = {bg = colors.red, fg = colors.bg}
  },
  replace = {},
  inavtive = {}
}

local mode_icon = {
  c = "🅒 ",
  i = "🅘 ",
  n = "🅝 ",
  R = "🅡 ",
  r = "🅡 ",
  s = "🅢 ",
  t = "🅣 ",
  v = "🅥 "
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = custom,
    component_separators = {left = "", right = ""},
    section_separators = {left = "", right = ""},
    disabled_filetypes = {"NvimTree", "DiffviewFilePanel"},
    always_divide_middle = true
  },
  sections = {
    lualine_a = {
      function()
        return mode_icon[vim.fn.mode()]
      end
    },
    lualine_b = {
      "branch",
      {
        "diff",
        symbols = {added = "+", modified = "~", removed = "-"},
        diff_color = {
          added = "DiffAdd", -- changes diff's added color
          modified = "PmenuSel", -- changes diff's modified color
          removed = "DiffDelete" -- changes diff's removed color you
        }
      }
    },
    lualine_c = {"diagnostics"},
    lualine_x = {{"filetype", padding = 0, icon_only = true}, "filename"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {{"buffers",padding = 2}},
    lualine_b = {""},
    lualine_c = {""},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {"tabs"}
  },
  extensions = {}
}
