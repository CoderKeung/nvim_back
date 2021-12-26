local util = require("util")
local global = require("util.global")
local fn = vim.fn

if util.packer_no_install() then
  fn.system({"git", "clone", "--depth", "1", global.packer_repo, global.packer_path})
end

local disable_distribution_plugins = function()
  vim.g.loaded_gzip = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_netrwFileHandlers = 1
end

disable_distribution_plugins()

vim.g.python_host_skip_check = 1
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_skip_check = 1
vim.g.python3_host_prog = "/usr/bin/python3"

vim.cmd [[filetype plugin off ]]
