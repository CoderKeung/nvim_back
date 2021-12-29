local autocmd = {}
local packer_config_dir = vim.fn.stdpath("config") .. "/lua"
-- local packer_config_dir = os.getenv("HOME").."/.dotfile/config/nvim/lua/packerConfig"

function autocmd:run()
  vim.cmd [[:silent w!]]
  local filetype = vim.o.filetype
  local dir = vim.fn.expand("%:p")
  local leetcode = "/Users/coderkeung/leetcode"
  if filetype == "c" then
    local cmd = "gcc " .. vim.fn.expand("%") .. " && time ./a.out && rm -rf a.out"
    require'toggleterm'.exec(cmd)
  elseif filetype == "lua" then
    vim.cmd[[luafile %]]
  elseif filetype == "cpp" then
    if dir:match(leetcode) then
      --local leetcodeMsg = vim.api.nvim_exec("!leetcode test %", {"non-shell"})
      --require "notify"(leetcodeMsg, "info", {timeout = 5000, title = "LeetCode", icon = ""})
      local leetcodeCmd = "leetcode test " .. vim.fn.expand("%")
      require("toggleterm").exec(leetcodeCmd)
    else
      local cmd = "g++ -std=c++11 " .. vim.fn.expand("%") .. " && time ./a.out && rm -rf a.out"
      require'toggleterm'.exec(cmd)
    end
  end
end

function autocmd:compile()
  local file = vim.fn.expand("%:p")
  if file:match(packer_config_dir) then
    vim.cmd [[ PackerClean ]]
    vim.cmd [[ PackerCompile ]]
    require "notify"("PackerCompile Success!", "info", {timeout = 10, render = "minimal"})
  end
end

function autocmd:leetcodeSubmit()
  local cmd = "leetcode submit " .. vim.fn.expand("%")
  require("toggleterm").exec(cmd)
end

return autocmd
