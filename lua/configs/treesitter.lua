local options = {
  ensure_installed = { "python", "json", "yaml", "javascript" },
}
return vim.tbl_deep_extend("force", require "nvchad.configs.treesitter", options)
