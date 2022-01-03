local parsers = require "nvim-treesitter.parsers"
local parser_list = parsers.available_parsers()

table.sort(parser_list)

local status = 0

for _, ft in pairs(parser_list) do
  local is_installed = #vim.api.nvim_get_runtime_file("parser/" .. ft .. ".so", false) > 0
  if not is_installed then
    status = status + 1
  end
end

if status > 10  then
  vim.api.nvim_command("set cmdheight=1")
end

require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
