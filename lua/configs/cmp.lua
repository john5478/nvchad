local cmp = require "cmp"

local options = {
  completion = {
    completeopt = "menu,menuone,noselect",
    autocomplete = false,
  },
  mapping = {
    ['<C-c>'] = cmp.mapping.complete(),
  }
}
return vim.tbl_deep_extend("force", require "nvchad.configs.cmp", options)
