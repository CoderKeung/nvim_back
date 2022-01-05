local util = require("util")
util.set_highlight("indent")

vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
  buftype_exclude = {"terminal"},
  filetype_exclude = {"dashboard","packer","startuptime"},
  space_char_blankline = " ",
  show_end_of_line = true,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6"
  }
}
