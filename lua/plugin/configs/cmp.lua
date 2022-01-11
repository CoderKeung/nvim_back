local util = require("util")

util.set_highlight("cmp")

-- Setup nvim-cmp.
local cmp = require "cmp"
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind_icons = {
  Text          = "",
  Method        = "",
  Function      = "",
  Constructor   = "",
  Field         = "",
  Variable      = "",
  Class         = "ﴯ",
  Interface     = "",
  Module        = "",
  Property      = "ﰠ",
  Unit          = "",
  Value         = "",
  Enum          = "",
  Keyword       = "",
  Snippet       = "",
  Color         = "",
  File          = "",
  Reference     = "",
  Folder        = "",
  EnumMember    = "",
  Constant      = "",
  Struct        = "",
  Event         = "",
  Operator      = "",
  TypeParameter = ""
}

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup(
  {
    formatting = {
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
        -- Source
        vim_item.menu =
          ({
          buffer = "",
          nvim_lsp = "",
          luasnip = "",
          nvim_lua = "",
          latex_symbols = ""
        })[entry.source.name]
        -- Change itrm maxwidth
        -- vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
        return vim_item
      end
    },
    window = {
      documentation = {
        border = "single";
        scrollbar = "║"
      },
      completion = {
        border = "single";
        scrollbar = "║"
      }
    },
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    mapping = {
      ["<Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.fn["vsnip#available"](1) == 1 then
          feedkey("<Plug>(vsnip-expand-or-jump)", "")
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end,
      ["<S-Tab>"] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        else
          fallback()
        end
      end,
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm({select = true})
    },
    sources = cmp.config.sources(
      {
        {name = "nvim_lsp"},
        {name = "vsnip"}
      },
      {
        {name = "buffer"},
        {name = "path"}
      }
    )
  }
)

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  "/",
  {
    sources = {
      {name = "buffer"}
    }
  }
)

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(
  ":",
  {
    sources = cmp.config.sources(
      {
        {name = "path"}
      },
      {
        {name = "cmdline"}
      }
    )
  }
)
