local fn = vim.fn

local global = {}

global.data_path = fn.stdpath("data")
global.packer_path = global.data_path.."/site/pack/packer/opt/packer.nvim"
global.packer_repo = "https://github.com/wbthomason/packer.nvim"

return global
