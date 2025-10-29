vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Source out nvim init.conf
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>", { desc = "Source init.lua" })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Automatically mirror all yanks to Windows clipboard under WSL
if vim.fn.has("wsl") == 1 then
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      local yanked = vim.fn.getreg('"')      -- get last yank (default register)
      vim.fn.system("clip.exe", yanked)      -- send to Windows clipboard
    end,
    desc = "Yank also to Windows clipboard via clip.exe",
  })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    local yanked = vim.fn.getreg('"')
    vim.fn.system("clip.exe", yanked)
    vim.notify("📋 Yanked to Windows clipboard")
  end,
  desc = "Yank also to Windows clipboard via clip.exe",
})
-- vim.keymap.set("n", "<leader>fe", fzf.files, { noremap = true, silent = true, desc = "FZF: Find files" })
-- vim.keymap.set("n", "<leader>ff", fzf.buffers, { noremap = true, silent = true, desc = "FZF: Find buffers" })

