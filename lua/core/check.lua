local check = {}
local uv = vim.loop

check.has_zer0_cmdheight = function ()
  local has,_ = pcall(vim.cmd, "set cmdheight=0")
  if has then
    return false
  end
  return true
end

check.has_clangd = function ()
  local has = uv.spawn("clangd",{args={"--version"}})
  if has then
    return true
  end
  return false
end

check.has_lua_lsp = function ()
  local has = uv.spawn("lua-language-server",{args={"--version"}})
  if has then
    return true
  end
  return false
end

return check
