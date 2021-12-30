local M = {}
function M.load_main()
  require("core.beforload")
  require("core.evens")
  require("core.option")
  require("core.keymap")
  require("plugin")
end

return M.load_main()
