return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
      require('Comment').setup()
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    opts = function()
      return require "configs.cmp"
    end,
  },

  {
  "debugloop/telescope-undo.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      {
        "<leader>u",
        "<cmd>Telescope undo<cr>",
        desc = "undo history",
      },
    },
    opts = function()
      return require("configs.undo")
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = require("configs.flash"),
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<C-a>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    'Exafunction/windsurf.vim',
    event = 'BufEnter',
    config = function ()
      require('configs.windsurf')
    end
  },

  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require("configs.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
  },

  {
    "jinh0/eyeliner.nvim",
    event = "VeryLazy",
    config = function ()
      require('configs.eyeliner')
    end
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
          surrounds = {
            ["%"] = {
                add = { "{% ", " %}" },
                find = "{[%%].-[%%]}",
                delete = "^({[%%] ?)().-( ?[%%]})()$",
            },
            ["j"] = {
                add = { "{{ ", " }}" },
                find = "{{.-}}",
                delete = "^({{ ?)().-( ?}})()$",
            }
          }
        })
    end
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      require('rainbow-delimiters.setup').setup()
    end
  },

  {
    'dense-analysis/ale',
    event = "User FilePost",
  },

  {
    "olimorris/codecompanion.nvim",
    event = 'BufEnter',
    opts = function()
      return require("configs.codecompanion")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "ravitemer/mcphub.nvim",
    event = 'BufEnter',
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    config = function()
        require("mcphub").setup()
    end
  },
}
