local fn = vim.fn

local global = {}

global.data_path = fn.stdpath("data")
global.packer_path = global.data_path.."/site/pack/packer/opt/packer.nvim"
global.packer_repo = "https://github.com/wbthomason/packer.nvim"
global.treesitter_path = global.data_path.."/site/pack/packer/opt/nvim-treesitter"
global.treesitter_repo = "https://github.com/nvim-treesitter/nvim-treesitter"

return global
