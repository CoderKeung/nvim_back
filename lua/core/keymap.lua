local keymap = vim.api.nvim_set_keymap

-- System Keymap
keymap("n", "E", "<cmd>q!<CR>", {noremap = true, silent = true})
keymap("n", "Q", "<cmd>wq!<CR>", {noremap = true, silent = true})
keymap("n", "S", "<cmd>w!<CR>", {noremap = true, silent = true})
keymap("n", "<Tab>", "<C-w>w", {noremap = true, silent = true})
keymap("n", "<C-h>", "<C-w><", {noremap = true, silent = true})
keymap("n", "<C-l>", "<C-w>>", {noremap = true, silent = true})
keymap("n", "<C-k>", "<C-w>+", {noremap = true, silent = true})
keymap("n", "<C-j>", "<C-w>-", {noremap = true, silent = true})
vim.g.mapleader = " "

-- NvimTree Keymap
keymap("n", "t", "<cmd>NvimTreeToggle<CR>", {noremap = true, silent = true})
keymap("i", "<C-t>", "<cmd>NvimTreeToggle<CR>", {noremap = true, silent = true})

-- Colorizer Keymap
keymap("n", "z", "<cmd>ColorizerToggle<CR>", {noremap = true, silent = true})

-- Telescope Keymap
keymap("n", "Ff", "<cmd>Telescope find_files<CR>", {noremap = true, silent = true})
keymap("n", "Fl", "<cmd>Telescope help_tags<CR>", {noremap = true, silent = true})
keymap("n", "Fm", '<cmd>lua require"custom.find".fd_nvim_dir()<CR>', {noremap = true, silent = true})
keymap("n", "Fn", "<cmd>bnext<CR>", {noremap = true, silent = true})

-- Running code Keymap
keymap("n", "Fr", '<cmd>lua require "core.autocmd".run()<CR>', {noremap = true, silent = true})
keymap("n", "Fs", "<cmd>lua require('core.autocmd').leetcodeSubmit()<CR>", {noremap = true, silent = true})

-- Diffview Keymap
keymap("n", "Fk", "<cmd>DiffviewOpen<CR>", {noremap = true, silent = true})
keymap("n", "Fj", "<cmd>DiffviewClose <CR>", {noremap = true, silent = true})
keymap("n", "Fo", "<cmd>DiffviewToggleFiles<CR>", {noremap = true, silent = true})
keymap("n", "Fh", "<cmd>DiffviewFileHistory<CR>", {noremap = true, silent = true})

-- Focus Keymap
keymap("n", "Fi", "<cmd>FocusToggle<CR>", {noremap = true, silent = true})

-- LazyGit Keymap
keymap("n", "Fg", "<cmd>lua require 'custom.lazygit'.LazygitToggle()<CR>", {noremap = true, silent = true})

-- GitBlame Keymap
keymap("n", "Fb", "<cmd>GitBlameToggle<CR>", {noremap = true, silent = true})

-- ToggleTerm Keymap
keymap("n", "<A-i>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true})
keymap("t", "<A-i>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true})

-- Tagbar Keymap
keymap("n", "Ft", "<cmd>TagbarToggle<CR>", {noremap = true, silent = true})

-- Twilight Keymap
keymap("n", "Fw", "<cmd>Twilight<CR>", {noremap = true, silent = true})

-- ZenMode Keymap
keymap("n", "Fz", "<cmd>ZenMode<CR>", {noremap = true, silent = true})

-- Format Keymap
keymap("n", "Fa", "<cmd>FormatWrite<CR>", {noremap = true, silent = true})

-- Trouble Keymap
keymap("n", "Fv", "<cmd>TroubleToggle<CR>", {noremap = true, silent = true})

-- Leetcode Keymap
keymap("n", "Fc", "<cmd>lua require'custom.leetcode'.leetcode_toggle(require'custom.leetcode'.dropdown())<CR>", {noremap = true, silent = true})

-- Cmd Keymap
keymap('n', ':', '<cmd>:lua require("custom.cmd").cmdEnter()<CR>:', {noremap = true})
keymap('n', '/', '<cmd>:lua require("custom.cmd").cmdEnter()<CR>/', {noremap = true})
