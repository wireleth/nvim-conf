return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('gitsigns').setup({
        signs = {
          add          = {hl = 'GitGutterAdd', text = '+', numhl='GitGutterAddNr'},
          change       = {hl = 'GitGutterChange', text = '~', numhl='GitGutterChangeNr'},
          delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitGutterDeleteNr'},
          topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitGutterDeleteNr'},
          changedelete = {hl = 'GitGutterChangeDelete', text = '~', numhl='GitGutterChangeDeleteNr'},
        },
        numhl = true,      -- highlight line numbers
        linehl = false,    -- highlight lines
        watch_gitdir = { interval = 1000 },
        current_line_blame = true, -- show inline blame info
      })

      -- Optional keymaps
      local gs = package.loaded.gitsigns
      vim.keymap.set('n', '<leader>hs', gs.stage_hunk, {desc = 'Stage hunk'})
      vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, {desc = 'Undo stage hunk'})
      vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {desc = 'Preview hunk'})
      vim.keymap.set('n', '<leader>hb', gs.blame_line, {desc = 'Blame line'})
    end
  }
}

