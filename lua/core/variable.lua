local util = require("util")

local variable = {
  globale = {
    vimwiki_list = {
      {
        path = os.getenv("HOME") .. "/Documents/Vimwiki",
        path_html = os.getenv("HOME") .. "/Documents/Vimwiki_Html"
      }
    },
    loaded_gzip = 1,
    loaded_tar = 1,
    loaded_tarPlugin = 1,
    loaded_zip = 1,
    loaded_zipPlugin = 1,
    loaded_getscript = 1,
    loaded_getscriptPlugin = 1,
    loaded_vimball = 1,
    loaded_vimballPlugin = 1,
    loaded_matchit = 1,
    loaded_matchparen = 1,
    loaded_2html_plugin = 1,
    loaded_logiPat = 1,
    loaded_rrhelper = 1,
    loaded_netrw = 1,
    loaded_netrwPlugin = 1,
    loaded_netrwSettings = 1,
    loaded_netrwFileHandlers = 1,
    python_host_skip_check = 1,
    python3_host_skip_check = 1,
    python_host_prog = "/usr/local/bin/python",
    python3_host_prog = "/usr/local/bin/python3",
  }
}

util.set_global_variable(variable.globale)
