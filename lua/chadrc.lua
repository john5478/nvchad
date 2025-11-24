-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "monekai",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}
local processing = false
local spinner_idx = 1
local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

local function start_spinner()
  if timer then
    return
  end

  timer = vim.loop.new_timer()
  timer:start(100, 100, vim.schedule_wrap(function()
    if processing then
      spinner_idx = (spinner_idx % 10) + 1
      vim.cmd.redrawstatus()
    else
      if timer then
        timer:stop()
        timer:close()
        timer = nil
      end
    end
  end))
end

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "CodeCompanionRequest*",
  callback = function(args)
    if args.match == "CodeCompanionRequestStarted" then
      processing = true
      start_spinner()
    elseif args.match == "CodeCompanionRequestFinished" then
      processing = false
      vim.cmd.redrawstatus()
    end
  end,
})

-- M.nvdash = { load_on_startup = true }
M.ui = {
  statusline = {
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "codecompanion", "windsurf", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      windsurf = function()
        return vim.api.nvim_call_function("codeium#GetStatusString", {})
      end,
      codecompanion = function()
        if processing then
          spinner_idx = (spinner_idx % 10) + 1
          return "%#St_LspMsg#" .. spinners[spinner_idx] .. " "
        end
        return ""
      end,
    }
  }
}

return M
