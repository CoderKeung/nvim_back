local util = require("util")
local check = require("util.check")

local function check_cmdheight()
  if check.has_zer0_cmdheight() then
    return 0
  end
  return 1
end

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
  cmdheight= check_cmdheight(),
  laststatus=2,
}

util.set_option(options)
