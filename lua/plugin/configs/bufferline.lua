require("bufferline").setup {
  options = {
    offsets = {{filetype = "NvimTree", text = "", padding = 1}},
    buffer_close_icon = "",
    show_buffer_icons = false,
    modified_icon = "",
    indicator_icon = "",
    close_icon = "",
    show_close_icon = false,
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    show_tab_indicators = false,
    enforce_regular_tabs = false,
    view = "default",
    show_buffer_close_icons = true,
    separator_style = {"", ""},
    always_show_bufferline = true,
    diagnostics = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or " ")
        s = s .. n .. sym
      end
      return s
    end,
    custom_filter = function(buf_number)
      -- Func to filter out our managed/persistent split terms
      local present_type, type =
        pcall(
        function()
          return vim.api.nvim_buf_get_var(buf_number, "term_type")
        end
      )

      if present_type then
        if type == "vert" then
          return false
        elseif type == "hori" then
          return false
        end
        return true
      end

      return true
    end
  },
  highlights = {
    background = {
      guibg = "none"
    },
    buffer_visible = {
      guibg = "#e78a4e",
      guifg = "#242a32",
      gui = "none"
    },
    buffer_selected = {
      guibg = "#e78a4e",
      guifg = "#242a32",
      gui = "none"
    },
    separator = {
      guifg = "#e78a4e"
    },
    separator_visible = {
      guibg = "none"
    },
    separator_selected = {
      guibg = "none"
    },
    modified = {
      guibg = "none",
      guifg = "#5faf5f"
    },
    modified_visible = {
      guibg = "none",
      guifg = "#5faf5f"
    },
    modified_selected = {
      guibg = "#e78a4e",
      guifg = "#242a32"
    },
    close_button = {
      guibg = "none"
    },
    close_button_visible = {
      guibg = "#e78a4e",
      guifg = "#242a32"
    },
    close_button_selected = {
      guibg = "#e78a4e",
      guifg = "#242a32"
    },
    fill = {
      guibg = "none"
    },
    tab = {
      guibg = "none"
    },
    tab_selected = {
      guibg = "#ec5f67"
    },
    tab_close = {
      guibg = "none"
    },
  }
}
