return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},

	lazy = false, -- neo-tree will lazily load itself
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		filesystem = {
			follow_current_file = { enabled = true },
		},
	},
	keys = {
		{ "<leader>e", "<Cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
	},
}
