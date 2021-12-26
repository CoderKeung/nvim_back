-- in lua/finders.lua
local M = {}

-- Dropdown list theme using a builtin theme definitions :
local center_list =
  require "telescope.themes".get_dropdown(
  {
    winblend = 10,
    width = 0.5,
    prompt = " ",
    results_height = 15,
    previewer = false,
    border = true,
    borderchars = {
      prompt = {"━", "┃", " ", "┃", "┏", "┓", "┃", "┃"},
      results = {"━", "┃", "━", "┃", "┣", "┫", "┛", "┗"},
      preview = {"─", "│", "─", "┃", "╭", "╮", "╯", "╰"}
    }
  }
)

-- Settings for with preview option
local with_preview = {
  winblend = 10,
  show_line = false,
  results_title = false,
  preview_title = false,
  layout_config = {
    preview_width = 0.5
  }
}

M.fd_nvim_dir = function()
  local opts = vim.deepcopy(center_list)
  opts.prompt_prefix = "🤖 "
  opts.selection_caret = "📂 "
  opts.entry_prefix = "📁 "
  opts.prompt_title = "Neovim Configures File 💙"
  opts.cwd = vim.fn.stdpath("config")
  require "telescope.builtin".fd(opts)
end

return M
