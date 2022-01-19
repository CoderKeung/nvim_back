local util = require("util")
local check = require("util.check")

local function check_cmdheight()
  if check.has_zero_cmdheight() then
    return 0
  end
  return 1
end

local options = {
  completeopt    = "menuone,noinsert,noselect",
  sw             = 2,
  tabstop        = 2,
  softtabstop    = 2,
  shiftwidth     = 2,
  expandtab      = true,
  number         = true,
  relativenumber = true,
  termguicolors  = true,
  clipboard      = "unnamedplus",
  showmode       = false,
  updatetime     = 300,
  undofile       = true,
  fillchars      = "vert:▏",
  cmdheight      = check_cmdheight(),
  laststatus     = 2,
  guifont        = "FiraCode Nerd Font:h18",
}

util.set_option(options)
