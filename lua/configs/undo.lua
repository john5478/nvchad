local options = {
  extensions = {
    undo = {
      mappings = {
        i = {
          ["<CR>"] = require("telescope-undo.actions").restore,
        }
      }
    }
  }
}
return options
