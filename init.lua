vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = ";"
vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'pwsh.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'pwsh.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

-- local vim = vim
-- local Plug = vim.fn["plug#"]
--
-- vim.call('plug#begin')
-- Plug('easymotion/vim-easymotion')
-- Plug('haya14busa/incsearch.vim')
-- Plug('haya14busa/incsearch-easymotion.vim')
-- vim.call('plug#end')
--
-- local function config_easyfuzzymotion(opts)
--   local base = {
--     converters = { vim.fn["incsearch#config#fuzzyword#converter"]() },
--     modules = { vim.fn["incsearch#config#easymotion#module"]({ overwin = 1 }) },
--     keymap = { ["<CR>"] = "<Over>(easymotion)" },
--     is_expr = 0,
--     is_stay = 1,
--   }
--
--   if opts ~= nil then
--     for k, v in pairs(opts) do
--       base[k] = v
--     end
--   end
--
--   return base
-- end
-- vim.g["incsearch#config#easyfuzzymotion#config"] = config_easyfuzzymotion
