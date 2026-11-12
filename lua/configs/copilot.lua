require("copilot").setup({
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-g>",
      accept_word = false,
      accept_line = false,
      next = "<C-j>",
      prev = "<C-k>",
      dismiss = "<C-e>",
    },
  },
})
