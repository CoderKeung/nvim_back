local keymap = vim.api.nvim_set_keymap
local check = require("util.check")

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
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", {noremap = true, silent = true})
keymap("n", "<leader>l", "<cmd>Telescope help_tags<CR>", {noremap = true, silent = true})
keymap("n", "<leader>m", '<cmd>lua require"custom.find".fd_nvim_dir()<CR>', {noremap = true, silent = true})
keymap("n", "<leader>n", "<cmd>bnext<CR>", {noremap = true, silent = true})

-- Running code Keymap
keymap("n", "<leader>r", '<cmd>lua require "custom.coderun".run()<CR>', {noremap = true, silent = true})
keymap("n", "<leader>s", "<cmd>lua require('custom.coderun').leetcodeSubmit()<CR>", {noremap = true, silent = true})

-- Diffview Keymap
keymap("n", "<leader>k", "<cmd>DiffviewOpen<CR>", {noremap = true, silent = true})
keymap("n", "<leader>j", "<cmd>DiffviewClose <CR>", {noremap = true, silent = true})
keymap("n", "<leader>o", "<cmd>DiffviewToggleFiles<CR>", {noremap = true, silent = true})
keymap("n", "<leader>h", "<cmd>DiffviewFileHistory<CR>", {noremap = true, silent = true})

-- Focus Keymap
keymap("n", "<leader>i", "<cmd>FocusToggle<CR>", {noremap = true, silent = true})

-- LazyGit Keymap
keymap("n", "<leader>g", "<cmd>lua require 'custom.lazygit'.LazygitToggle()<CR>", {noremap = true, silent = true})

-- GitBlame Keymap
keymap("n", "<leader>b", "<cmd>GitBlameToggle<CR>", {noremap = true, silent = true})

-- ToggleTerm Keymap
keymap("n", "<A-i>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true})
keymap("t", "<A-i>", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true})

-- Tagbar Keymap
keymap("n", "<leader>t", "<cmd>TagbarToggle<CR>", {noremap = true, silent = true})

-- Twilight Keymap
keymap("n", "<leader>w", "<cmd>Twilight<CR>", {noremap = true, silent = true})

-- ZenMode Keymap
keymap("n", "<leader>z", "<cmd>ZenMode<CR>", {noremap = true, silent = true})

-- Format Keymap
keymap("n", "<leader>a", "<cmd>FormatWrite<CR>", {noremap = true, silent = true})

-- Trouble Keymap
keymap("n", "<leader>v", "<cmd>TroubleToggle<CR>", {noremap = true, silent = true})

-- Leetcode Keymap
keymap("n", "<leader>c", "<cmd>lua require'custom.leetcode'.leetcode_toggle(require'custom.leetcode'.dropdown())<CR>", {noremap = true, silent = true})

-- Hugo Keymap
keymap("n", "<leader>q", "<cmd>lua require'custom.hugo'.post()<CR>", {noremap = true, silent = true})
keymap("n", "<leader>H", "<cmd>lua require'custom.hugo_list'.toggle(require'custom.hugo_list'.dropdown())<CR>", {noremap = true, silent = true})

-- Cmd Keymap
if check.has_zero_cmdheight() then
  keymap('n', ':', '<cmd>:lua require("custom.cmd").cmdEnter()<CR>:', {noremap = true})
  keymap('v', ':', '<cmd>:lua require("custom.cmd").cmdEnter()<CR>:', {noremap = true})
  keymap('n', '/', '<cmd>:lua require("custom.cmd").cmdEnter()<CR>/', {noremap = true})
end

