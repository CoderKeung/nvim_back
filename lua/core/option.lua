local util = require("util")

local options = {
  completeopt = "menuone,noinsert,noselect",
  sw = 2,
  expandtab = true,
  number = true,
  t_Co = 256,
  relativenumber = true,
  termguicolors = true,
  clipboard = "unnamedplus",
--  cursorline = true,
  showmode = false,
  updatetime = 300,
  undofile = true
}

util.set_option(options)
