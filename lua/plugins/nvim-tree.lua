return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		    "nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {
      git = {
        enable = true,
        ignore = false,
      },
      filters = {
        dotfiles = false,
      }
    }
	end,
}
