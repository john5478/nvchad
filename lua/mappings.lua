require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>cd", ":cd %:p:h<CR>")
map('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
map('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
map('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
map('n', '<leader>ts', [[:%s/\s\+$//e<cr>]])
map("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

local mc = require("multicursor-nvim")
mc.setup()

-- Add or skip adding a new cursor by matching word/selection
map({"n", "x"}, "<C-n>", function() mc.matchAddCursor(1) end)
map({"n", "x"}, "<C-k>", function() mc.matchSkipCursor(1) end)
map({"n", "x"}, "<C-m>", function() mc.matchSkipCursor(-1) end)

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)
    -- Enable and clear cursors using escape.
    layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
