local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local action_layout = require("telescope.actions.layout")

require("telescope").setup {
  defaults = {
    theme = "ivy",
    mappings = {
      i = {["<c-t>"] = trouble.open_with_trouble},
      n = {
        ["Fp"] = action_layout.toggle_preview,
        ["<c-t>"] = trouble.open_with_trouble
      }
    }
  },
  pickers = {
    find_files = {
      theme = "ivy",
      border = true,
      borderchars = {
        prompt = {"━", "┃", " ", "┃", "┏", "┓", "┃", "┃"},
        results = {"━", "┃", "━", "┃", "┣", "┫", "┛", "┗"},
        preview = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"}
      },
      mappings = {
        n = {
          ["cd"] = function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent cd %s", dir))
          end
        }
      }
    },
    colorscheme = {
      theme = "ivy",
      border = true,
      borderchars = {
        prompt = {"━", "┃", " ", "┃", "┏", "┓", "┃", "┃"},
        results = {"━", "┃", "━", "┃", "┣", "┫", "┛", "┗"},
        preview = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"}
      }
    },
    oldfiles = {
      theme = "ivy",
      border = true,
      borderchars = {
        prompt = {"━", "┃", " ", "┃", "┏", "┓", "┃", "┃"},
        results = {"━", "┃", "━", "┃", "┣", "┫", "┛", "┗"},
        preview = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"}
      }
    },
    live_grep = {
      theme = "ivy",
      border = true,
      borderchars = {
        prompt = {"━", "┃", " ", "┃", "┏", "┓", "┃", "┃"},
        results = {"━", "┃", "━", "┃", "┣", "┫", "┛", "┗"},
        preview = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"}
      }
    },
    marks = {
      theme = "ivy",
      border = true,
      borderchars = {
        prompt = {"━", "┃", " ", "┃", "┏", "┓", "┃", "┃"},
        results = {"━", "┃", "━", "┃", "┣", "┫", "┛", "┗"},
        preview = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"}
      }
    },
    help_tags = {
      theme = "ivy",
      border = true,
      borderchars = {
        prompt = {"━", "┃", " ", "┃", "┏", "┓", "┃", "┃"},
        results = {"━", "┃", "━", "┃", "┣", "┫", "┛", "┗"},
        preview = {"━", "┃", "━", "┃", "┏", "┓", "┛", "┗"}
      }
    }
  }
}
