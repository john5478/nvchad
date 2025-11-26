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
  extensions = {
    mcphub = {
      callback = "mcphub.extensions.codecompanion",
      opts = {
        make_vars = true,
        make_slash_commands = true,
        show_result_in_chat = true
      }
    }
  },
  opts = {
    log_level = "DEBUG"
  }
}
