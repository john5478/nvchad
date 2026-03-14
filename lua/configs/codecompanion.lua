return {
  rules = {
    opts = {
      chat = {
        enabled = false
      },
    },
  },
  adapters = {
    acp = {
      gemini_cli = function()
        return require("codecompanion.adapters").extend("gemini_cli", {
          commands = {
            default = {
              "gemini",
              "--acp",
            },
            yolo = {
              "gemini",
              "--acp",
              "--yolo",
            },
          },
        })
      end,
    },
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
      adapter = "gemini_cli",
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
      adapter = "gemini_cli",
    },
    cmd = {
      adapter = "gemini_cli",
    }
  },
  interactions = {
    chat = {
      adapter = "gemini_cli",
    }
  },
  opts = {
    log_level = "DEBUG",
    timeout = 30000,
  }
}
