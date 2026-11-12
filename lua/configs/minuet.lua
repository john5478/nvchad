require("minuet").setup({
  provider = "gemini",
  n_completions = 1,
  throttle = 1000,
  debounce = 250,
  request_timeout = 3,

  virtualtext = {
    auto_trigger_ft = { "*" },
    keymap = {
      accept = "<C-g>",
      accept_line = nil,
      accept_n_lines = nil,
      next = "<C-j>",
      prev = "<C-k>",
      dismiss = "<C-e>",
    },
  },

  provider_options = {
    gemini = {
      model = "gemini-2.0-flash",
      -- 注意：字串代表環境變數名稱；若要直接填入 key 請改為 function() return "..." end
      api_key = "GEMINI_API_KEY",
      stream = true,
      optional = {
        generationConfig = {
          maxOutputTokens = 256,
          topP = 0.9,
        },
      },
    },
  },
})
