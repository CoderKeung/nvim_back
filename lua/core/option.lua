local util = require("util")

local options = {
  completeopt = "menuone,noinsert,noselect",
  sw = 2,
  expandtab = true,
  number = true,
  relativenumber = true,
  termguicolors = true,
  clipboard = "unnamedplus",
  showmode = false,
  updatetime = 300,
  undofile = true,
  fillchars = "vert: ",
  cmdheight=0,
  laststatus=1,
}

util.set_option(options)
