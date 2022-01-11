local modules = {}

modules["theniceboy/nvim-deus"] = {
  config = function() vim.cmd[[colorscheme deus]] end
}

modules["glepnir/oceanic-material"] = {
  opt = true,
  config = function() vim.cmd[[colorscheme oceanic_material]] end
}

modules["olimorris/onedarkpro.nvim"] = {
  opt = true,
  config = function() require('onedarkpro').load() end
}

modules["kyazdani42/nvim-tree.lua"] = {
  cmd = {"NvimTreeToggle", "NvimTreeOpen"},
  requires = {"kyazdani42/nvim-web-devicons", opt = true},
  config = function() require("plugin.configs.tree") end
}

modules["nvim-treesitter/nvim-treesitter"] = {
  run = ":TSUpdate",
  event = "BufRead",
  after = "telescope.nvim",
  config = function() require("plugin.configs.treesitter") end
}

modules["p00f/nvim-ts-rainbow"] = {
  event = "BufRead",
  after = "nvim-treesitter"
}

modules["norcalli/nvim-colorizer.lua"] = {
  cmd = "ColorizerToggle",
  ft = {"html", "css", "sass", "vim", "typescript", "typescriptreact"},
  config = function() require "colorizer".setup() end
}

modules["neovim/nvim-lspconfig"] = {
  requires = {
    {"hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp"},
    {"Iron-E/nvim-cmp", branch = "feat/completion-menu-borders",event = {"InsertEnter","CmdlineEnter"}, config = function() require("plugin.configs.cmp") end},
    {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
    {"hrsh7th/cmp-path", after = "nvim-cmp"},
    {"hrsh7th/cmp-cmdline", after = "nvim-cmp"},
    {"hrsh7th/cmp-vsnip", after = "nvim-cmp", event = "InsertCharPre"},
    {"hrsh7th/vim-vsnip", after = "nvim-cmp", event = "InsertCharPre", config = function() vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/vsnip" end}
  },
  event = {"BufReadPre", "BufNewFile"},
  module = "lspconfig",
  config = function() require("plugin.configs.lsp") end
}

modules["nvim-telescope/telescope.nvim"] = {
  module = "telescope",
  cmd = "Telescope",
  requires = {"kyazdani42/nvim-web-devicons", opt = true},
  config = function() require("plugin.configs.telescope") end
}

modules["nvim-lua/plenary.nvim"] = {
  module = "plenary",
  opt = true
}

modules["nvim-lualine/lualine.nvim"] = {
  requires = {"kyazdani42/nvim-web-devicons", opt = true},
  config = function() require("plugin.configs.lualine") end
}

modules["akinsho/bufferline.nvim"] = {
  requires = "kyazdani42/nvim-web-devicons",
  config = function() require("plugin.configs.bufferline") end
}

modules["lewis6991/gitsigns.nvim"] = {
  event = {"BufRead", "BufNewFile"},
  config = function() require("gitsigns").setup() end
}

modules["glepnir/dashboard-nvim"] = {
  config = function() require("plugin.configs.dashboard") end
}

modules["folke/trouble.nvim"] = {
  cmd = "TroubleToggle",
  module = "trouble",
  requires = {"kyazdani42/nvim-web-devicons", opt = true},
  config = function() require("plugin.configs.trouble")end
}

modules["windwp/nvim-autopairs"] = {
  event = "InsertEnter",
  config = function() require("nvim-autopairs").setup{} end
}

modules["numToStr/Comment.nvim"] = {
  event = "BufRead",
  config = function() require("Comment").setup{} end
}

modules["dstein64/vim-startuptime"] = {
  cmd = "StartupTime"
}

modules["f-person/git-blame.nvim"] = {
  cmd = {"GitBlameToggle"},
  config = function() vim.g.gitblame_message_template = "   <summary> • <date> • <author>" end
}

modules["godlygeek/tabular"] = {
  ft = {"markdown"},
  after = "vim-markdown"
}

modules["plasticboy/vim-markdown"] = {
  ft = {"markdown"},
  config = function() vim.g.vim_markdown_toml_frontmatter = 1 end
}

modules["cespare/vim-toml"] = {
  ft = {"markdown", "toml"},
  after = "vim-markdown"
}

modules["vimwiki/vimwiki"] = {
  config = function() vim.cmd [[ filetype plugin on ]] end,
  keys = {"<Leader>ww"}
}

modules["beauwilliams/focus.nvim"] = {
  cmd = {"FocusSplitNicely", "FocusToggle"},
  module = "focus",
  config = function() require("focus").setup({signcolumn = false, excluded_filetypes = {"diffview"}, minwidth = 30}) end
}

modules["sindrets/diffview.nvim"] = {
  cmd = {"DiffviewOpen"},
  config = function() require("plugin.configs.diffview")end
}

modules["akinsho/toggleterm.nvim"] = {
  module = "toggleterm",
  cmd = {"ToggleTerm"},
  config = function() require("plugin.configs.toggleterm")end
}

modules["preservim/tagbar"] = {
  cmd = "TagbarToggle"
}

modules["folke/twilight.nvim"] = {
  cmd = "Twilight",
  config = function() require("plugin.configs.twilight") end
}

modules["folke/zen-mode.nvim"] = {
  cmd = "ZenMode",
  config = function() require("plugin.configs.zenmode") end
}

modules["karb94/neoscroll.nvim"] = {
  keys = {"<C-f>"},
  config = function() require("plugin.configs.neoscroll") end
}

modules["rcarriga/nvim-notify"] = {
  module = "notify",
  config = function() require("plugin.configs.notify") end
}

modules["mhartington/formatter.nvim"] = {
  cmd = "FormatWrite",
  config = function() require("plugin.configs.formatter") end
}

modules["folke/lua-dev.nvim"] = {
  module = "lua-dev"
}

modules["lukas-reineke/indent-blankline.nvim"] = {
  event = "BufRead",
  config = function() require("plugin.configs.indent") end
}

modules["nathom/filetype.nvim"] = {}

modules["godlygeek/tabular"] = {
  cmd = "Tabularize",
}

return modules
