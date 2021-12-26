local fn = vim.fn
local global = require("util.global")

local util = {}

function util.set_option(tab)
  for option_name, option_value in pairs(tab) do
    vim.o[option_name] = option_value
  end
end

function util.packer_no_install()
  if fn.empty(fn.glob(global.packer_path)) > 0 then
    return true
  else
    return false
  end
end

function util.break_module(tbl)
  local module =  {}
  for k,v in pairs(tbl) do
    table.insert(v,k)
    table.insert(module,v)
  end
  return module
end

return util
