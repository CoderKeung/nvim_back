local execute = vim.api.nvim_command
local global = require("util.global")

local util = {}

function util.set_option(tab)
  for option_name, option_value in pairs(tab) do
    vim.o[option_name] = option_value
  end
end

function util.packer_install()
  local has_packer ,_ = pcall(vim.cmd, "packadd packer.nvim")
  if not has_packer then
    print("Cloning packer......")
    vim.fn.system({"git", "clone", "--depth", "1", global.packer_repo, global.packer_path})

    execute("packadd packer.nvim")
    local precent, packer = pcall(require, "packer")
    if precent then
      print("Packer cloned successfully.")
      return true
    else
      error("Couldn't clone packer !\nPacker path: " .. global.packer_path .. "\n" .. packer)
      return false
    end
  end
  return false
end

function util.break_module(tbl)
  local module =  {}
  for k,v in pairs(tbl) do
    table.insert(v,k)
    table.insert(module,v)
  end
  return module
end

function util.create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

function util.set_global_variable(global_varibal)
  for variable_name, variable_value in pairs(global_varibal) do
    vim.g[variable_name] = variable_value
  end
end

function util.set_highlight(name)
  local tbl = require("color.highlight")[name]
  for highlight_name, highlight_value in pairs(tbl) do
    local cmd
    if type(highlight_value) == "table" then
      cmd = "highlight! link "..highlight_name.." "..highlight_value[1]
    else
      cmd = "highlight! "..highlight_name.." "..highlight_value
    end
    vim.cmd(cmd)
  end
end

return util
