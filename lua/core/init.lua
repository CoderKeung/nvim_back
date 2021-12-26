local M = {}
function M.load_main()
  require("core.beforload")
  require("core.option")
  require("core.keymap")
  require("plugin")
end

M.load_main()
