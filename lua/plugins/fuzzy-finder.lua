return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
    local fzf = require("fzf-lua")
    vim.keymap.set("n", "<leader>ff", fzf.buffers, { noremap = true, silent = true, desc = "FZF: Buffers" })
    vim.keymap.set("n", "<leader>fe", fzf.files, { noremap = true, silent = true, desc = "FZF: Files" })
  end,
}

