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
      opencode = function()
        return require("codecompanion.adapters").extend("opencode", {
          defaults = {
            model = "google/gemma-4-31b-it"
          },
        })
      end,
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
      adapter = "opencode",
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
      adapter = "opencode",
    },
    cmd = {
      adapter = "opencode",
    }
  },
  interactions = {
    chat = {
      adapter = "opencode",
    }
  },
  opts = {
    log_level = "DEBUG",
    timeout = 30000,
  }
}
