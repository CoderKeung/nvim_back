require "toggleterm".setup {
  -- size = 40,
  hide_numbers = true,
  direction = "float",
  shell = vim.o.shell,
  float_opts = {
    border = {"┏", "━", "┓", "┃", "┛", "━", "┗", "┃"},
    width = 150,
    height = 20,
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal"
    }
  }
}
