local nvchad_opts = require "nvchad.configs.treesitter"
local ensure_installed = vim.list_extend(
  vim.deepcopy(nvchad_opts.ensure_installed or {}),
  { "python", "json", "yaml", "javascript", "markdown", "markdown_inline" }
)

local options = {
  ensure_installed = ensure_installed,
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- Function
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        -- Class
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Argument
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",

        -- Condition
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",

        -- Loop
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",

        -- Comment
        ["aC"] = "@comment.outer",

        -- Block
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      }
    }
  }
}
return vim.tbl_deep_extend("force", nvchad_opts, options)
