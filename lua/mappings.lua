require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", " ", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>cd", ":cd %:p:h<CR>")
map('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
map('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
map('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
