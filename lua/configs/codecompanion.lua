return {
  adapters = {
    http = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "cmd:cat ~/.config/nvim/.gemini_apikey",
          },
        })
      end,
    },
  },
  strategies = {
    chat = {
      adapter = "gemini",
      keymaps = {
        close = {
          modes = {
            n = "<leader>q",
            i = "<leader>q"
          },
        },
      },
    },
    inline = {
      adapter = "gemini",
    },
    cmd = {
      adapter = "gemini",
    }
  },
  opts = {
    log_level = "DEBUG"
  }
}
