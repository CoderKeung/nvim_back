vim.api.nvim_command("augroup packer")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command('autocmd BufWritePost *.lua lua require("core.autocmd").compile()')
vim.api.nvim_command("augroup end")

vim.cmd[[
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
au BufEnter,BufWinEnter,BufWinEnter,WinEnter,WinLeave,CmdwinEnter, * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
autocmd CmdlineLeave * lua require "custom.cmd".cmdExit() 
]]
