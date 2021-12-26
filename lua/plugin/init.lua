vim.api.nvim_command("packadd packer.nvim")
local util = require("util")
local modules = require("plugin.modules")
local packer = require("packer")

local use = packer.use

local repos = util.break_module(modules)

packer.startup({
  function()
    -- Packer can manage itself
    use {"wbthomason/packer.nvim", opt = true}
    for _,repo in pairs(repos) do
      use(repo)
    end
  end
})

