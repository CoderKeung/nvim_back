--[[
leetcode-cli config(config.json):
  "code": {
    "editor": "nvim"
  },
  "file": {
    "show": "${fid}"
  }
]]--

local leetcode = {}

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local leetcode_list = {}

local leetcodeCmd = "leetcode list "
local leetcodeDir = os.getenv("HOME").."/leetcode/"

local handle = io.popen(leetcodeCmd)

for problem in handle:lines("*l") do
  local tmp = {}
  local problemIndex = string.gmatch(problem, "%w+")
  table.insert(tmp, problemIndex())
  table.insert(tmp, problem)
  table.insert(leetcode_list, tmp)
end

handle:close()

leetcode.dropdown = function(opts)
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
      -- preview = {"─", "│", "─", "┃", "╭", "╮", "╯", "╰"}
    }
  }
  return vim.tbl_deep_extend("force", theme_opts, opts)
end

-- our picker function: colors
leetcode.leetcode_toggle = function(opts)
  opts = opts or {}
  pickers.new(
    opts,
    {
      prompt_title = "LeetCode🍺",
      prompt_prefix = "🍺 ",
      selection_caret = "📂",
      entry_prefix = "📁",
      finder = finders.new_table {
        results = leetcode_list,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry[2],
            ordinal = entry[2]
          }
        end
      },
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(
          function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            -- print(vim.inspect(selection))
            -- vim.api.nvim_put({selection[1]}, "", false, true)
            local cmd = "leetcode show " .. selection.value[1] .. " -gxo " .. leetcodeDir .. " >> /dev/null"
            os.execute(cmd)
            local filename = "tabnew " .. leetcodeDir .. selection.value[1] .. ".cpp"
            vim.cmd(filename)
          end
        )
        return true
      end
    }
  ):find()
end

return leetcode
