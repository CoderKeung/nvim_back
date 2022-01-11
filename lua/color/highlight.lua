local highlight = {}

highlight.default = {}

highlight.mt = {
  __index = highlight.default
}

function highlight.new(tbl)
  setmetatable(tbl, highlight.mt)
  return tbl
end

highlight.cmp = highlight.new {
  Pmenu                 = "guibg = NONE",
  CmpWindow             = "guibg = NONE",
  CmpWindowBorder       = "guifg = #e78a4e",
  CmpItemAbbrMatch      = "guibg = NONE guifg = #e78a4e",
  CmpItemAbbrDeprecated = "guibg = NONE gui   = strikethrough guifg = #808080",
  CmpItemAbbrMatchFuzzy = "guibg = NONE guifg = #e78a4e",
  CmpItemKindText       = "guibg = NONE guifg = #9CDCFE",
  CmpItemKindUnit       = "guibg = NONE guifg = #D4D4D4",
  CmpItemKindMethod     = "guibg = NONE guifg = #C586C0",
  CmpItemKindKeyword    = "guibg = NONE guifg = #D4D4D4",
  CmpItemKindVariable   = "guibg = NONE guifg = #9CDCFE",
  CmpItemKindFunction   = "guibg = NONE guifg = #C586C0",
  CmpItemKindProperty   = "guibg = NONE guifg = #D4D4D4",
  CmpItemKindInterface  = "guibg = NONE guifg = #9CDCFE",
}

highlight.indent = highlight.new {
  IndentBlanklineIndent1 = "guifg = #E06C75 gui = nocombine",
  IndentBlanklineIndent2 = "guifg = #E5C07B gui = nocombine",
  IndentBlanklineIndent3 = "guifg = #98C379 gui = nocombine",
  IndentBlanklineIndent4 = "guifg = #56B6C2 gui = nocombine",
  IndentBlanklineIndent5 = "guifg = #61AFEF gui = nocombine",
  IndentBlanklineIndent6 = "guifg = #C678DD gui = nocombine",
}

highlight.notify = highlight.new {
  NotifyINFOBorder  = "guifg = #65b1cd",
  NotifyERRORBorder = "guifg = #8A1F1F",
  NotifyWARNBorder  = "guifg = #79491D",
  NotifyDEBUGBorder = "guifg = #8B8B8B",
  NotifyTRACEBorder = "guifg = #4F3552",
  NotifyERRORIcon   = "guifg = #F70067",
  NotifyWARNIcon    = "guifg = #F79000",
  NotifyINFOIcon    = "guifg = #f6c177",
  NotifyDEBUGIcon   = "guifg = #8B8B8B",
  NotifyTRACEIcon   = "guifg = #D484FF",
  NotifyERRORTitle  = "guifg = #F70067",
  NotifyWARNTitle   = "guifg = #F79000",
  NotifyINFOTitle   = "guifg = #c4a7e7",
  NotifyDEBUGTitle  = "guifg = #8B8B8B",
  NotifyTRACETitle  = "guifg = #D484FF",
  NotifyERRORBody   = {"Normal"},
  NotifyWARNBody    = {"Normal"},
  NotifyINFOBody    = {"Normal"},
  NotifyDEBUGBody   = {"Normal"},
  NotifyTRACEBody   = {"Normal"},
}

highlight.tree = highlight.new {
  NvimTreeNormal           = "guibg = none",
  NvimTreeNormalNC         = "guibg = none",
  NvimTreeStatusLine       = "guibg = none",
  NvimTreeStatusLineNC     = "guibg = none guifg = #0A2B34",
  NvimTreeVertSplit        = "guibg = none",
  NvimTreeFolderIcon       = "guifg = #f6c177",
  NvimTreeOpenedFolderName = "guifg = #e78a41",
}

return highlight
