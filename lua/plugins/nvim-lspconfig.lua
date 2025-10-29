return {
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = {
    { "ms-jpq/coq_nvim",branch = "coq"},
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
    { "jose-elias-alvarez/typescript.nvim" }
  },
  init = function()
    vim.g.coq_settings = {
        auto_start = true, -- if you want to start COQ at startup
        display = {
          statusline = {
            helo = false
          }
        }
    }
  end,
  config = function()
    -- Your LSP settings here
  end,
}
