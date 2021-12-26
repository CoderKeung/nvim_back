local util = require("util")
local global = require("util.global")
local fn = vim.fn

if util.packer_no_install() then
  fn.system({"git", "clone", "--depth", "1", global.packer_repo, global.packer_path})
end
