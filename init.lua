-- Settings
vim.opt.expandtab = true      -- spaces instead of tabs
vim.opt.tabstop = 2           -- a Tab counts as 2 spaces
vim.opt.shiftwidth = 2        -- indentation width
vim.opt.softtabstop = 2       -- insert 2 spaces per Tab
vim.opt.autoindent = true     -- copy previous line indent
vim.opt.smartindent = true    -- auto-indent new blocks
-- Keymaps
require("config.keymaps")
-- require ("config.keymaps")

-- Customize diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",  -- could be '▎', '■', 'x'
    spacing = 2,
  },
  signs = true,             -- left column signs
  underline = true,         -- underline offending text
  update_in_insert = false, -- don’t update while typing
  severity_sort = true,     -- sort by severity
  float = {
    border = "rounded",
    source = "always",      -- show source (like eslint, lua_ls, etc.)
    header = "",
    prefix = "",
  },
})

require("config.lazy")
vim.cmd.colorscheme "catppuccin"
require("config.nvim-lspconfig")

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf ---@type number
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      vim.keymap.set('n', '<leader>i', function()
        vim.lsp.inlay_hint.enable(
          not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
          { bufnr = bufnr }
        )
      end, { buffer = bufnr })
    end
  end,
})
