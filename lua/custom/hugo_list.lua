local hugo_list = {}
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local previewers = require("telescope.previewers")

local hugo_dir = os.getenv("HOME") .. "/Documents/coderkeung.cn/"
local hugo_list_cmd = "cd " .. hugo_dir .. " && hugo list all"

local handle = io.popen(hugo_list_cmd)

local first_line = handle:read("*l")

local function creat_tag(strings)
  local tbl = {}
  for v in string.gmatch(strings, "(.-),") do
    table.insert(tbl, v)
  end
  return tbl
end

local tags = creat_tag(first_line)

local function create_post_tbl(iohandle, tag)
  local tbl = {}
  for v in iohandle:lines("*L") do
    local timesep = 1
    local tmp = {}
    for value in string.gmatch(v, "(.-),") do
      tmp[tag[timesep]] = value
      timesep = timesep + 1
    end
    table.insert(tbl, tmp)
    tmp = {}
  end
  return tbl
end

local post_tbl = create_post_tbl(handle, tags)

handle:close()

local post_name_tbl = {}

for _, value in pairs(post_tbl) do
  table.insert(post_name_tbl, value["title"])
end

hugo_list.dropdown = function(opts)
  opts = opts or {}

  local theme_opts = {
    theme = "dropdown",
    results_title = false,
    sorting_strategy = "ascending",
    layout_strategy = "center",
    layout_config = {
      preview_cutoff = 0, -- Preview should always show (unless previewer = false)
      width = function(_, max_columns, _)
        return math.min(max_columns, 100)
      end,
      height = function(_, _, max_lines)
        return math.min(max_lines, 20)
      end
    },
    border = true,
    borderchars = {
      prompt = {"━", "┃", " ", "┃", "┏", "┓", "┃", "┃"},
      results = {"━", "┃", "━", "┃", "┣", "┫", "┛", "┗"},
      preview = {"─", "│", "─", "┃", "╭", "╮", "╯", "╰"}
    }
  }
  return vim.tbl_deep_extend("force", theme_opts, opts)
end



hugo_list.toggle = function(opts)
  opts = opts or {}
  pickers.new(
    opts,
    {
      prompt_title = "Hugo Post 🍺",
      cwd = "",
      prompt_prefix = "🍺 ",
      selection_caret = "📂 ",
      entry_prefix = "📁 ",
      finder = finders.new_table {
        results = post_tbl,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry["title"],
            ordinal = entry["title"]
          }
        end
      },
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(
          function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            local cmd = "tabnew " .. hugo_dir .. selection.value["path"]
            vim.cmd(cmd)
          end
        )
        return true
      end
    }
  ):find()
end

return hugo_list
