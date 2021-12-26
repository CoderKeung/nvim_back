local Terminal = require("toggleterm.terminal").Terminal

local M = {}

local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = {"┏", "━", "┓", "┃", "┛", "━", "┗", "┃"},
      winblend = 10,
      width = 150,
      height = 40
    }
})

M.LazygitToggle = function ()
  lazygit:toggle()
end

return M
