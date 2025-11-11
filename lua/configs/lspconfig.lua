local lspconfig = require("nvchad.configs.lspconfig")
lspconfig.defaults()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local map = vim.keymap.set
    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    pcall(vim.keymap.del, "n", "gd", opts "Restore builtin gd")
    map("n", "<leader>d", vim.lsp.buf.definition, opts "Go to definition")
  end,
})

if vim.lsp.config then
  vim.lsp.config(
    "*",
    {
      capabilities = lspconfig.capabilities,
      on_init = lspconfig.on_init,
    }
  )
  vim.lsp.config(
    "pylsp",
    {
      settings = {
        pylsp = {
          plugins = {
            mccabe = {
              enabled = false
            },
          }
        },
      },
    }
  )
else
  require("lspconfig").pylsp.setup {
    capabilities = lspconfig.capabilities,
    on_init = lspconfig.on_init,
    settings = {
      pylsp = {
        plugins = {
          mccabe = {
            enabled = false
          },
        }
      },
    },
  }
end

local servers = { "html", "cssls", "pylsp", "jsonls" }
vim.lsp.enable(servers)
--
-- read :h vim.lsp.config for changing options of lsp servers
