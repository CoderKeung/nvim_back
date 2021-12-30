local M = {}

M.cmdEnter = function ()
  vim.cmd [[ set laststatus=0 ]]
  vim.cmd [[ set cmdheight=1 ]]
end

M.cmdExit = function ()
   vim.cmd [[ set cmdheight=0 ]]
   vim.cmd [[ set laststatus=2 ]]
end


return M
