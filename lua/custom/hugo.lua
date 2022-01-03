local api = vim.api

api.nvim_set_var("hugo_repo_dir", os.getenv("HOME") .. "/Documents/coderkeung.cn/")

local unique_name = "textDocument-rename"

local ui_status = api.nvim_list_uis()[1]

local win_width = math.floor(ui_status.width / 2)
local win_height = math.floor(ui_status.height / 2)
local win_row = math.floor((ui_status.height - win_height) / 2)
local win_col = math.floor((ui_status.width - win_width) / 2)

local prompt_prefix = "Hugo Post 🤔> "

local options = {
  relative = "editor",
  style = "minimal",
  width = win_width,
  height = 1,
  col = win_col,
  row = win_row,
  border = "rounded"
}

local create_win = function(opts)
  local bufnr = api.nvim_create_buf(false, true)
  api.nvim_buf_set_option(bufnr, "buftype", "prompt")
  vim.fn.prompt_setprompt(bufnr, prompt_prefix)
  local winid = api.nvim_open_win(bufnr, true, opts)
  vim.api.nvim_win_set_option(winid, "winhl", "Normal:LspFloatWinNormal,FloatBorder:Normal")
  vim.cmd [[startinsert!]]
  return bufnr, winid
end

local close_win = function()
  if vim.fn.mode() == "i" then
    vim.cmd [[stopinsert]]
  end
  local has, winid = pcall(api.nvim_win_get_var, 0, unique_name)
  local bufnr = api.nvim_win_get_buf(winid)
  if has then
    api.nvim_win_close(winid,true)
    api.nvim_buf_delete(bufnr,{force=true})
  end
end

local create_post = function()
  local post_name = vim.trim(vim.fn.getline("."):sub(#prompt_prefix + 1, -1))
  close_win()
  api.nvim_command("cd " .. vim.g.hugo_repo_dir)
  api.nvim_command("silent !hugo new technology/"..post_name..".md")
  api.nvim_command("tabnew "..vim.g.hugo_repo_dir.."content/technology/"..post_name..".md")
end

local post = function()
  local bufnr, winid = create_win(options)
  api.nvim_win_set_var(0, unique_name, winid)
  api.nvim_buf_set_keymap(
    bufnr,
    "i",
    "<CR>",
    "<CMD>lua require('custom.hugo').create_post()<CR>",
    {nowait = true, silent = true}
  )
end

return {
  post = post,
  create_post = create_post
}
