local toggleterm = require("toggleterm")

toggleterm.setup{
  size = function(term)
    return math.floor(vim.o.lines * 0.3)  -- horizontal terminal height
  end,
  open_mapping = [[<leader>th]],  -- horizontal terminal
  direction = "horizontal",
  close_on_exit = true,
}

-- Create a floating terminal mapped to <leader>tf
local Terminal  = require('toggleterm.terminal').Terminal
local float_term = Terminal:new({
  direction = "float",
  close_on_exit = true,
  float_opts = {
    border = "rounded",
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
  },
})

-- Map leader + tf to toggle float terminal
vim.keymap.set('n', '<leader>tf', function()
  float_term:toggle()
end, { noremap = true, silent = true })

