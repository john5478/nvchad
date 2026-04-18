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
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = {
              default = "gemini-3-flash-preview",
            },
          },
          env = {
            api_key = "cmd:cat ~/.local/share/opencode/auth.json | jq '.\"ollama-cloud\".key' -r",
            url = "https://ollama.com",
          },
          headers = {
            Authorization = "Bearer ${api_key}",
          },
        })
      end,
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          schema = {
            model = {
              default = "gemma-4-31b-it",
              choices = {
                ["gemma-4-31b-it"] = {
                  formatted_name = "Gemma 4 31B Instruction Tuned",
                  opts = { can_reason = true, has_vision = true },
                },
              },
            }
          },
          env = {
            api_key = "cmd:cat ~/.local/share/opencode/auth.json | jq '.google.key' -r",
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
  interactions = {
    chat = {
      adapter = "gemini",
    }
  },
  opts = {
    log_level = "DEBUG",
    timeout = 30000,
  }
}
