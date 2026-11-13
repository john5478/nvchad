-- vim.keymap.set({ "i", "n" }, "<C-g>", function()
--   local ok, nes = pcall(require, "copilot-lsp.nes")
--   if ok and nes.apply_pending_nes() then
--     nes.walk_cursor_end_edit()
--   end
-- end, { desc = "[copilot] accept NES suggestion", silent = true })
--
-- vim.keymap.set({ "i", "n" }, "<C-e>", function()
--   local ok, nes = pcall(require, "copilot-lsp.nes")
--   if ok then
--     nes.clear()
--   end
-- end, { desc = "[copilot] clear NES suggestion", silent = true })

require("copilot").setup({
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    trigger_on_accept = false,
    keymap = {
      accept = "<C-g>",
      accept_word = false,
      accept_line = false,
      next = "<C-j>",
      prev = "<C-k>",
      dismiss = "<C-e>",
    },
  },
  nes = {
    enabled = false,
    auto_trigger = true,
    keymap = {
      accept_and_goto = false,
      accept = false,
      dismiss = false,
    },
  },
})
