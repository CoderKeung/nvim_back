local util = require("util")
local global = require("util.global")
local execute = vim.api.nvim_command

local core = {}

function core.beforload()
  execute("hi TelescopePromptCounter guifg=#ebdbb2")
  execute("filetype plugin off ")
end

function core.check_packer_install()
  local packer_first_install = util.packer_install()
  if packer_first_install then
    require("plugin")
    require("packer").sync()
  else
    require("plugin")
  end
end

function core.load_main()
  core.beforload()
  require("core.option")
  require("core.keymap")
  require("core.event")
  require("core.variable")
  core.check_packer_install()
end

return core.load_main()
